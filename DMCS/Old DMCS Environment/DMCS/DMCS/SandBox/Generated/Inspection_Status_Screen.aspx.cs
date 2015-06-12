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
public partial class Inspection_Status_Screen : System.Web.UI.Page
{
            public Inspection_Status Inspection_Status = new Inspection_Status();
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
        Inspection_Status = Insert_Inspection_Status_select(Convert.ToInt32(Insert_Inspection_Status_GridView.SelectedValue));
    }
    public Inspection_Status Insert_Inspection_Status_select(int ID)
    {
        Inspection_Status = Inspection_Status.Select(ID);
        Insert_Evacuation_Area_ID_txt.Text = Convert.ToString(Inspection_Status.Evacuation_Area_ID);
        Insert_Address_ID_txt.Text = Convert.ToString(Inspection_Status.Address_ID);
        Insert_Inspection_Code_txt.Text = Convert.ToString(Inspection_Status.Inspection_Code);
        Insert_Client_Found_txt.Text = Convert.ToString(Inspection_Status.Client_Found);
        Insert_Client_Found_Status_txt.Text = Convert.ToString(Inspection_Status.Client_Found_Status);
        return Inspection_Status;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Inspection_Status = Inspection_Status_insert();
    }
    public Inspection_Status Inspection_Status_insert()
    {
        Inspection_Status.Evacuation_Area_ID = Convert.ToInt32(Insert_Evacuation_Area_ID_txt.Text);
        Inspection_Status.Address_ID = Convert.ToInt32(Insert_Address_ID_txt.Text);
        Inspection_Status.Inspection_Code = Insert_Inspection_Code_txt.Text;
        Inspection_Status.Client_Found = Insert_Client_Found_txt.Text;
        Inspection_Status.Client_Found_Status = Insert_Client_Found_Status_txt.Text;
        Inspection_Status = Inspection_Status.Insert(Inspection_Status);
        Insert_Inspection_Status_GridView.DataBind();
        Update_Inspection_Status_GridView.DataBind();
        Delete_Inspection_Status_GridView.DataBind();
        return Inspection_Status;
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
        Inspection_Status = Update_Inspection_Status_select(Convert.ToInt32(Update_Inspection_Status_GridView.SelectedValue));
    }
    public Inspection_Status Update_Inspection_Status_select(int ID)
    {
        Inspection_Status = Inspection_Status.Select(ID);
        Update_InspectionStatus_ID_txt.Text = Convert.ToString(Inspection_Status.InspectionStatus_ID);
        Update_Evacuation_Area_ID_txt.Text = Convert.ToString(Inspection_Status.Evacuation_Area_ID);
        Update_Address_ID_txt.Text = Convert.ToString(Inspection_Status.Address_ID);
        Update_Inspection_Code_txt.Text = Convert.ToString(Inspection_Status.Inspection_Code);
        Update_Client_Found_txt.Text = Convert.ToString(Inspection_Status.Client_Found);
        Update_Client_Found_Status_txt.Text = Convert.ToString(Inspection_Status.Client_Found_Status);
        return Inspection_Status;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Inspection_Status = Inspection_Status_update(Convert.ToInt32(Update_Inspection_Status_GridView.SelectedValue));
    }
    public Inspection_Status Inspection_Status_update(int ID)
    {
        Inspection_Status = Inspection_Status.Select(ID);
        Inspection_Status.InspectionStatus_ID = Convert.ToInt32(Update_InspectionStatus_ID_txt.Text);
        Inspection_Status.Evacuation_Area_ID = Convert.ToInt32(Update_Evacuation_Area_ID_txt.Text);
        Inspection_Status.Address_ID = Convert.ToInt32(Update_Address_ID_txt.Text);
        Inspection_Status.Inspection_Code = Update_Inspection_Code_txt.Text;
        Inspection_Status.Client_Found = Update_Client_Found_txt.Text;
        Inspection_Status.Client_Found_Status = Update_Client_Found_Status_txt.Text;
        Inspection_Status.Update(Inspection_Status);
        Insert_Inspection_Status_GridView.DataBind();
        Update_Inspection_Status_GridView.DataBind();
        Delete_Inspection_Status_GridView.DataBind();
        return Inspection_Status;
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
        Inspection_Status = Delete_Inspection_Status_select(Convert.ToInt32(Delete_Inspection_Status_GridView.SelectedValue));
    }
    public Inspection_Status Delete_Inspection_Status_select(int ID)
    {
        Inspection_Status = Inspection_Status.Select(ID);
        Delete_InspectionStatus_ID_txt_lbl.Text = Convert.ToString(Inspection_Status.InspectionStatus_ID);
        Delete_Evacuation_Area_ID_txt_lbl.Text = Convert.ToString(Inspection_Status.Evacuation_Area_ID);
        Delete_Address_ID_txt_lbl.Text = Convert.ToString(Inspection_Status.Address_ID);
        Delete_Inspection_Code_txt_lbl.Text = Convert.ToString(Inspection_Status.Inspection_Code);
        Delete_Client_Found_txt_lbl.Text = Convert.ToString(Inspection_Status.Client_Found);
        Delete_Client_Found_Status_txt_lbl.Text = Convert.ToString(Inspection_Status.Client_Found_Status);
        return Inspection_Status;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Inspection_Status_delete(Convert.ToInt32(Delete_Inspection_Status_GridView.SelectedValue));
    }
    public void Inspection_Status_delete(int ID)
    {
        Inspection_Status.Delete(ID);
        Insert_Inspection_Status_GridView.DataBind();
        Update_Inspection_Status_GridView.DataBind();
        Delete_Inspection_Status_GridView.DataBind();
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

