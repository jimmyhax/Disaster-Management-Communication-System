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
public partial class Obstruction_Screen : System.Web.UI.Page
{
            public Obstruction Obstruction = new Obstruction();
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
        Obstruction = Insert_Obstruction_select(Convert.ToInt32(Insert_Obstruction_GridView.SelectedValue));
    }
    public Obstruction Insert_Obstruction_select(int ID)
    {
        Obstruction = Obstruction.Select(ID);
        Insert_Evacuation_Area_ID_txt.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
        Insert_Location_ID_txt.Text = Convert.ToString(Obstruction.Location_ID);
        Insert_Date_Reported_txt.Text = Convert.ToString(Obstruction.Date_Reported);
        Insert_Expected_Recovery_Date_txt.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
        Insert_Type_txt.Text = Convert.ToString(Obstruction.Type);
        Insert_Severity_txt.Text = Convert.ToString(Obstruction.Severity);
        return Obstruction;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Obstruction = Obstruction_insert();
    }
    public Obstruction Obstruction_insert()
    {
        Obstruction.Evacuation_Area_ID = Convert.ToInt32(Insert_Evacuation_Area_ID_txt.Text);
        Obstruction.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        Obstruction.Date_Reported = Convert.ToDateTime(Insert_Date_Reported_txt.Text);
        Obstruction.Expected_Recovery_Date = Convert.ToDateTime(Insert_Expected_Recovery_Date_txt.Text);
        Obstruction.Type = Insert_Type_txt.Text;
        Obstruction.Severity = Insert_Severity_txt.Text;
        Obstruction = Obstruction.Insert(Obstruction);
        Insert_Obstruction_GridView.DataBind();
        Update_Obstruction_GridView.DataBind();
        Delete_Obstruction_GridView.DataBind();
        return Obstruction;
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
        Obstruction = Update_Obstruction_select(Convert.ToInt32(Update_Obstruction_GridView.SelectedValue));
    }
    public Obstruction Update_Obstruction_select(int ID)
    {
        Obstruction = Obstruction.Select(ID);
        Update_Obstruction_ID_txt.Text = Convert.ToString(Obstruction.Obstruction_ID);
        Update_Evacuation_Area_ID_txt.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
        Update_Location_ID_txt.Text = Convert.ToString(Obstruction.Location_ID);
        Update_Date_Reported_txt.Text = Convert.ToString(Obstruction.Date_Reported);
        Update_Expected_Recovery_Date_txt.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
        Update_Type_txt.Text = Convert.ToString(Obstruction.Type);
        Update_Severity_txt.Text = Convert.ToString(Obstruction.Severity);
        return Obstruction;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Obstruction = Obstruction_update(Convert.ToInt32(Update_Obstruction_GridView.SelectedValue));
    }
    public Obstruction Obstruction_update(int ID)
    {
        Obstruction = Obstruction.Select(ID);
        Obstruction.Obstruction_ID = Convert.ToInt32(Update_Obstruction_ID_txt.Text);
        Obstruction.Evacuation_Area_ID = Convert.ToInt32(Update_Evacuation_Area_ID_txt.Text);
        Obstruction.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        Obstruction.Date_Reported = Convert.ToDateTime(Update_Date_Reported_txt.Text);
        Obstruction.Expected_Recovery_Date = Convert.ToDateTime(Update_Expected_Recovery_Date_txt.Text);
        Obstruction.Type = Update_Type_txt.Text;
        Obstruction.Severity = Update_Severity_txt.Text;
        Obstruction.Update(Obstruction);
        Insert_Obstruction_GridView.DataBind();
        Update_Obstruction_GridView.DataBind();
        Delete_Obstruction_GridView.DataBind();
        return Obstruction;
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
        Obstruction = Delete_Obstruction_select(Convert.ToInt32(Delete_Obstruction_GridView.SelectedValue));
    }
    public Obstruction Delete_Obstruction_select(int ID)
    {
        Obstruction = Obstruction.Select(ID);
        Delete_Obstruction_ID_txt_lbl.Text = Convert.ToString(Obstruction.Obstruction_ID);
        Delete_Evacuation_Area_ID_txt_lbl.Text = Convert.ToString(Obstruction.Evacuation_Area_ID);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(Obstruction.Location_ID);
        Delete_Date_Reported_txt_lbl.Text = Convert.ToString(Obstruction.Date_Reported);
        Delete_Expected_Recovery_Date_txt_lbl.Text = Convert.ToString(Obstruction.Expected_Recovery_Date);
        Delete_Type_txt_lbl.Text = Convert.ToString(Obstruction.Type);
        Delete_Severity_txt_lbl.Text = Convert.ToString(Obstruction.Severity);
        return Obstruction;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Obstruction_delete(Convert.ToInt32(Delete_Obstruction_GridView.SelectedValue));
    }
    public void Obstruction_delete(int ID)
    {
        Obstruction.Delete(ID);
        Insert_Obstruction_GridView.DataBind();
        Update_Obstruction_GridView.DataBind();
        Delete_Obstruction_GridView.DataBind();
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

