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
public partial class Pet_Vaccine_Screen : System.Web.UI.Page
{
            public Pet_Vaccine Pet_Vaccine = new Pet_Vaccine();
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
        Pet_Vaccine = Insert_Pet_Vaccine_select(Convert.ToInt32(Insert_Pet_Vaccine_GridView.SelectedValue));
    }
    public Pet_Vaccine Insert_Pet_Vaccine_select(int ID)
    {
        Pet_Vaccine = Pet_Vaccine.Select(ID);
        Insert_Vaccine_Type_ID_txt.Text = Convert.ToString(Pet_Vaccine.Vaccine_Type_ID);
        Insert_Allergies_txt.Text = Convert.ToString(Pet_Vaccine.Allergies);
        Insert_Current_Medacations_txt.Text = Convert.ToString(Pet_Vaccine.Current_Medacations);
        Insert_Last_Vaccine_Given_txt.Text = Convert.ToString(Pet_Vaccine.Last_Vaccine_Given);
        Insert_Date_Time_Stamp_txt.Text = Convert.ToString(Pet_Vaccine.Date_Time_Stamp);
        return Pet_Vaccine;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pet_Vaccine = Pet_Vaccine_insert();
    }
    public Pet_Vaccine Pet_Vaccine_insert()
    {
        Pet_Vaccine.Vaccine_Type_ID = Convert.ToInt32(Insert_Vaccine_Type_ID_txt.Text);
        Pet_Vaccine.Allergies = Insert_Allergies_txt.Text;
        Pet_Vaccine.Current_Medacations = Insert_Current_Medacations_txt.Text;
        Pet_Vaccine.Last_Vaccine_Given = Convert.ToDateTime(Insert_Last_Vaccine_Given_txt.Text);
        Pet_Vaccine.Date_Time_Stamp = Convert.ToDateTime(Insert_Date_Time_Stamp_txt.Text);
        Pet_Vaccine = Pet_Vaccine.Insert(Pet_Vaccine);
        Insert_Pet_Vaccine_GridView.DataBind();
        Update_Pet_Vaccine_GridView.DataBind();
        Delete_Pet_Vaccine_GridView.DataBind();
        return Pet_Vaccine;
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
        Pet_Vaccine = Update_Pet_Vaccine_select(Convert.ToInt32(Update_Pet_Vaccine_GridView.SelectedValue));
    }
    public Pet_Vaccine Update_Pet_Vaccine_select(int ID)
    {
        Pet_Vaccine = Pet_Vaccine.Select(ID);
        Update_Pet_Vaccine_ID_txt.Text = Convert.ToString(Pet_Vaccine.Pet_Vaccine_ID);
        Update_Vaccine_Type_ID_txt.Text = Convert.ToString(Pet_Vaccine.Vaccine_Type_ID);
        Update_Allergies_txt.Text = Convert.ToString(Pet_Vaccine.Allergies);
        Update_Current_Medacations_txt.Text = Convert.ToString(Pet_Vaccine.Current_Medacations);
        Update_Last_Vaccine_Given_txt.Text = Convert.ToString(Pet_Vaccine.Last_Vaccine_Given);
        Update_Date_Time_Stamp_txt.Text = Convert.ToString(Pet_Vaccine.Date_Time_Stamp);
        return Pet_Vaccine;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pet_Vaccine = Pet_Vaccine_update(Convert.ToInt32(Update_Pet_Vaccine_GridView.SelectedValue));
    }
    public Pet_Vaccine Pet_Vaccine_update(int ID)
    {
        Pet_Vaccine = Pet_Vaccine.Select(ID);
        Pet_Vaccine.Pet_Vaccine_ID = Convert.ToInt32(Update_Pet_Vaccine_ID_txt.Text);
        Pet_Vaccine.Vaccine_Type_ID = Convert.ToInt32(Update_Vaccine_Type_ID_txt.Text);
        Pet_Vaccine.Allergies = Update_Allergies_txt.Text;
        Pet_Vaccine.Current_Medacations = Update_Current_Medacations_txt.Text;
        Pet_Vaccine.Last_Vaccine_Given = Convert.ToDateTime(Update_Last_Vaccine_Given_txt.Text);
        Pet_Vaccine.Date_Time_Stamp = Convert.ToDateTime(Update_Date_Time_Stamp_txt.Text);
        Pet_Vaccine.Update(Pet_Vaccine);
        Insert_Pet_Vaccine_GridView.DataBind();
        Update_Pet_Vaccine_GridView.DataBind();
        Delete_Pet_Vaccine_GridView.DataBind();
        return Pet_Vaccine;
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
        Pet_Vaccine = Delete_Pet_Vaccine_select(Convert.ToInt32(Delete_Pet_Vaccine_GridView.SelectedValue));
    }
    public Pet_Vaccine Delete_Pet_Vaccine_select(int ID)
    {
        Pet_Vaccine = Pet_Vaccine.Select(ID);
        Delete_Pet_Vaccine_ID_txt_lbl.Text = Convert.ToString(Pet_Vaccine.Pet_Vaccine_ID);
        Delete_Vaccine_Type_ID_txt_lbl.Text = Convert.ToString(Pet_Vaccine.Vaccine_Type_ID);
        Delete_Allergies_txt_lbl.Text = Convert.ToString(Pet_Vaccine.Allergies);
        Delete_Current_Medacations_txt_lbl.Text = Convert.ToString(Pet_Vaccine.Current_Medacations);
        Delete_Last_Vaccine_Given_txt_lbl.Text = Convert.ToString(Pet_Vaccine.Last_Vaccine_Given);
        Delete_Date_Time_Stamp_txt_lbl.Text = Convert.ToString(Pet_Vaccine.Date_Time_Stamp);
        return Pet_Vaccine;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pet_Vaccine_delete(Convert.ToInt32(Delete_Pet_Vaccine_GridView.SelectedValue));
    }
    public void Pet_Vaccine_delete(int ID)
    {
        Pet_Vaccine.Delete(ID);
        Insert_Pet_Vaccine_GridView.DataBind();
        Update_Pet_Vaccine_GridView.DataBind();
        Delete_Pet_Vaccine_GridView.DataBind();
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

