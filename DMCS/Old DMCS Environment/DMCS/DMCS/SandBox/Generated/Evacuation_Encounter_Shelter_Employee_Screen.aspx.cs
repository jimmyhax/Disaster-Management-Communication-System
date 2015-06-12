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
public partial class Evacuation_Encounter_Shelter_Employee_Screen : System.Web.UI.Page
{
            public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee = new Evacuation_Encounter_Shelter_Employee();
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
        Evacuation_Encounter_Shelter_Employee = Insert_Evacuation_Encounter_Shelter_Employee_select(Convert.ToInt32(Insert_Evacuation_Encounter_Shelter_Employee_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Employee Insert_Evacuation_Encounter_Shelter_Employee_select(int ID)
    {
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
        Insert_Shelter_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Shelter_ID);
        Insert_Employee_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Employee_ID);
        Insert_Evacuation_Area_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID);
        Insert_Encounter_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Encounter_ID);
        return Evacuation_Encounter_Shelter_Employee;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_insert();
    }
    public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_insert()
    {
        Evacuation_Encounter_Shelter_Employee.Shelter_ID = Convert.ToInt32(Insert_Shelter_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Employee_ID = Convert.ToInt32(Insert_Employee_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID = Convert.ToInt32(Insert_Evacuation_Area_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Encounter_ID = Convert.ToInt32(Insert_Encounter_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Insert(Evacuation_Encounter_Shelter_Employee);
        Insert_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        Update_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        Delete_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        return Evacuation_Encounter_Shelter_Employee;
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
        Evacuation_Encounter_Shelter_Employee = Update_Evacuation_Encounter_Shelter_Employee_select(Convert.ToInt32(Update_Evacuation_Encounter_Shelter_Employee_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Employee Update_Evacuation_Encounter_Shelter_Employee_select(int ID)
    {
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
        Update_Evacuation_Encounter_Shelter_Employee_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID);
        Update_Shelter_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Shelter_ID);
        Update_Employee_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Employee_ID);
        Update_Evacuation_Area_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID);
        Update_Encounter_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Encounter_ID);
        return Evacuation_Encounter_Shelter_Employee;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee_update(Convert.ToInt32(Update_Evacuation_Encounter_Shelter_Employee_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Employee Evacuation_Encounter_Shelter_Employee_update(int ID)
    {
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
        Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID = Convert.ToInt32(Update_Evacuation_Encounter_Shelter_Employee_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Shelter_ID = Convert.ToInt32(Update_Shelter_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Employee_ID = Convert.ToInt32(Update_Employee_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID = Convert.ToInt32(Update_Evacuation_Area_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Encounter_ID = Convert.ToInt32(Update_Encounter_ID_txt.Text);
        Evacuation_Encounter_Shelter_Employee.Update(Evacuation_Encounter_Shelter_Employee);
        Insert_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        Update_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        Delete_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        return Evacuation_Encounter_Shelter_Employee;
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
        Evacuation_Encounter_Shelter_Employee = Delete_Evacuation_Encounter_Shelter_Employee_select(Convert.ToInt32(Delete_Evacuation_Encounter_Shelter_Employee_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Employee Delete_Evacuation_Encounter_Shelter_Employee_select(int ID)
    {
        Evacuation_Encounter_Shelter_Employee = Evacuation_Encounter_Shelter_Employee.Select(ID);
        Delete_Evacuation_Encounter_Shelter_Employee_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Encounter_Shelter_Employee_ID);
        Delete_Shelter_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Shelter_ID);
        Delete_Employee_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Employee_ID);
        Delete_Evacuation_Area_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Evacuation_Area_ID);
        Delete_Encounter_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Employee.Encounter_ID);
        return Evacuation_Encounter_Shelter_Employee;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Evacuation_Encounter_Shelter_Employee_delete(Convert.ToInt32(Delete_Evacuation_Encounter_Shelter_Employee_GridView.SelectedValue));
    }
    public void Evacuation_Encounter_Shelter_Employee_delete(int ID)
    {
        Evacuation_Encounter_Shelter_Employee.Delete(ID);
        Insert_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        Update_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
        Delete_Evacuation_Encounter_Shelter_Employee_GridView.DataBind();
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

