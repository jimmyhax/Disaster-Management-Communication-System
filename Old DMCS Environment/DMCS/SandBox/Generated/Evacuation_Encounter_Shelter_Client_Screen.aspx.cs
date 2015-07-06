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
public partial class Evacuation_Encounter_Shelter_Client_Screen : System.Web.UI.Page
{
            public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client = new Evacuation_Encounter_Shelter_Client();
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
        Evacuation_Encounter_Shelter_Client = Insert_Evacuation_Encounter_Shelter_Client_select(Convert.ToInt32(Insert_Evacuation_Encounter_Shelter_Client_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Client Insert_Evacuation_Encounter_Shelter_Client_select(int ID)
    {
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
        Insert_Evacuation_Area_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID);
        Insert_Encounter_Id_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Encounter_Id);
        Insert_Start_Date_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Start_Date);
        Insert_End_Date_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.End_Date);
        Insert_Shelter_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Shelter_ID);
        Insert_Client_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Client_ID);
        return Evacuation_Encounter_Shelter_Client;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_insert();
    }
    public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_insert()
    {
        Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID = Convert.ToInt32(Insert_Evacuation_Area_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client.Encounter_Id = Convert.ToInt32(Insert_Encounter_Id_txt.Text);
        Evacuation_Encounter_Shelter_Client.Start_Date = Convert.ToDateTime(Insert_Start_Date_txt.Text);
        Evacuation_Encounter_Shelter_Client.End_Date = Convert.ToDateTime(Insert_End_Date_txt.Text);
        Evacuation_Encounter_Shelter_Client.Shelter_ID = Convert.ToInt32(Insert_Shelter_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client.Client_ID = Convert.ToInt32(Insert_Client_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Insert(Evacuation_Encounter_Shelter_Client);
        Insert_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        Update_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        Delete_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        return Evacuation_Encounter_Shelter_Client;
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
        Evacuation_Encounter_Shelter_Client = Update_Evacuation_Encounter_Shelter_Client_select(Convert.ToInt32(Update_Evacuation_Encounter_Shelter_Client_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Client Update_Evacuation_Encounter_Shelter_Client_select(int ID)
    {
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
        Update_Evacuation_Encounter_Shelter_Client_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID);
        Update_Evacuation_Area_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID);
        Update_Encounter_Id_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Encounter_Id);
        Update_Start_Date_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Start_Date);
        Update_End_Date_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.End_Date);
        Update_Shelter_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Shelter_ID);
        Update_Client_ID_txt.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Client_ID);
        return Evacuation_Encounter_Shelter_Client;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client_update(Convert.ToInt32(Update_Evacuation_Encounter_Shelter_Client_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Client Evacuation_Encounter_Shelter_Client_update(int ID)
    {
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
        Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID = Convert.ToInt32(Update_Evacuation_Encounter_Shelter_Client_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID = Convert.ToInt32(Update_Evacuation_Area_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client.Encounter_Id = Convert.ToInt32(Update_Encounter_Id_txt.Text);
        Evacuation_Encounter_Shelter_Client.Start_Date = Convert.ToDateTime(Update_Start_Date_txt.Text);
        Evacuation_Encounter_Shelter_Client.End_Date = Convert.ToDateTime(Update_End_Date_txt.Text);
        Evacuation_Encounter_Shelter_Client.Shelter_ID = Convert.ToInt32(Update_Shelter_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client.Client_ID = Convert.ToInt32(Update_Client_ID_txt.Text);
        Evacuation_Encounter_Shelter_Client.Update(Evacuation_Encounter_Shelter_Client);
        Insert_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        Update_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        Delete_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        return Evacuation_Encounter_Shelter_Client;
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
        Evacuation_Encounter_Shelter_Client = Delete_Evacuation_Encounter_Shelter_Client_select(Convert.ToInt32(Delete_Evacuation_Encounter_Shelter_Client_GridView.SelectedValue));
    }
    public Evacuation_Encounter_Shelter_Client Delete_Evacuation_Encounter_Shelter_Client_select(int ID)
    {
        Evacuation_Encounter_Shelter_Client = Evacuation_Encounter_Shelter_Client.Select(ID);
        Delete_Evacuation_Encounter_Shelter_Client_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Encounter_Shelter_Client_ID);
        Delete_Evacuation_Area_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Evacuation_Area_ID);
        Delete_Encounter_Id_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Encounter_Id);
        Delete_Start_Date_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Start_Date);
        Delete_End_Date_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.End_Date);
        Delete_Shelter_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Shelter_ID);
        Delete_Client_ID_txt_lbl.Text = Convert.ToString(Evacuation_Encounter_Shelter_Client.Client_ID);
        return Evacuation_Encounter_Shelter_Client;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Evacuation_Encounter_Shelter_Client_delete(Convert.ToInt32(Delete_Evacuation_Encounter_Shelter_Client_GridView.SelectedValue));
    }
    public void Evacuation_Encounter_Shelter_Client_delete(int ID)
    {
        Evacuation_Encounter_Shelter_Client.Delete(ID);
        Insert_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        Update_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
        Delete_Evacuation_Encounter_Shelter_Client_GridView.DataBind();
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

