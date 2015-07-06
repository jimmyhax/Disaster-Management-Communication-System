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
public partial class requestor_Screen : System.Web.UI.Page
{
            public requestor requestor = new requestor();
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
        requestor = Insert_requestor_select(Convert.ToInt32(Insert_requestor_GridView.SelectedValue));
    }
    public requestor Insert_requestor_select(int ID)
    {
        requestor = requestor.Select(ID);
        Insert_EncounterID_txt.Text = Convert.ToString(requestor.EncounterID);
        Insert_Requestor_Type_txt.Text = Convert.ToString(requestor.Requestor_Type);
        Insert_MobilUnitID_txt.Text = Convert.ToString(requestor.MobilUnitID);
        Insert_PersonID_txt.Text = Convert.ToString(requestor.PersonID);
        Insert_AgencyID_txt.Text = Convert.ToString(requestor.AgencyID);
        return requestor;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        requestor = requestor_insert();
    }
    public requestor requestor_insert()
    {
        requestor.EncounterID = Convert.ToInt32(Insert_EncounterID_txt.Text);
        requestor.Requestor_Type = Insert_Requestor_Type_txt.Text;
        requestor.MobilUnitID = Convert.ToInt32(Insert_MobilUnitID_txt.Text);
        requestor.PersonID = Convert.ToInt32(Insert_PersonID_txt.Text);
        requestor.AgencyID = Convert.ToInt32(Insert_AgencyID_txt.Text);
        requestor = requestor.Insert(requestor);
        Insert_requestor_GridView.DataBind();
        Update_requestor_GridView.DataBind();
        Delete_requestor_GridView.DataBind();
        return requestor;
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
        requestor = Update_requestor_select(Convert.ToInt32(Update_requestor_GridView.SelectedValue));
    }
    public requestor Update_requestor_select(int ID)
    {
        requestor = requestor.Select(ID);
        Update_RequestorID_txt.Text = Convert.ToString(requestor.RequestorID);
        Update_EncounterID_txt.Text = Convert.ToString(requestor.EncounterID);
        Update_Requestor_Type_txt.Text = Convert.ToString(requestor.Requestor_Type);
        Update_MobilUnitID_txt.Text = Convert.ToString(requestor.MobilUnitID);
        Update_PersonID_txt.Text = Convert.ToString(requestor.PersonID);
        Update_AgencyID_txt.Text = Convert.ToString(requestor.AgencyID);
        return requestor;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        requestor = requestor_update(Convert.ToInt32(Update_requestor_GridView.SelectedValue));
    }
    public requestor requestor_update(int ID)
    {
        requestor = requestor.Select(ID);
        requestor.RequestorID = Convert.ToInt32(Update_RequestorID_txt.Text);
        requestor.EncounterID = Convert.ToInt32(Update_EncounterID_txt.Text);
        requestor.Requestor_Type = Update_Requestor_Type_txt.Text;
        requestor.MobilUnitID = Convert.ToInt32(Update_MobilUnitID_txt.Text);
        requestor.PersonID = Convert.ToInt32(Update_PersonID_txt.Text);
        requestor.AgencyID = Convert.ToInt32(Update_AgencyID_txt.Text);
        requestor.Update(requestor);
        Insert_requestor_GridView.DataBind();
        Update_requestor_GridView.DataBind();
        Delete_requestor_GridView.DataBind();
        return requestor;
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
        requestor = Delete_requestor_select(Convert.ToInt32(Delete_requestor_GridView.SelectedValue));
    }
    public requestor Delete_requestor_select(int ID)
    {
        requestor = requestor.Select(ID);
        Delete_RequestorID_txt_lbl.Text = Convert.ToString(requestor.RequestorID);
        Delete_EncounterID_txt_lbl.Text = Convert.ToString(requestor.EncounterID);
        Delete_Requestor_Type_txt_lbl.Text = Convert.ToString(requestor.Requestor_Type);
        Delete_MobilUnitID_txt_lbl.Text = Convert.ToString(requestor.MobilUnitID);
        Delete_PersonID_txt_lbl.Text = Convert.ToString(requestor.PersonID);
        Delete_AgencyID_txt_lbl.Text = Convert.ToString(requestor.AgencyID);
        return requestor;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        requestor_delete(Convert.ToInt32(Delete_requestor_GridView.SelectedValue));
    }
    public void requestor_delete(int ID)
    {
        requestor.Delete(ID);
        Insert_requestor_GridView.DataBind();
        Update_requestor_GridView.DataBind();
        Delete_requestor_GridView.DataBind();
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

