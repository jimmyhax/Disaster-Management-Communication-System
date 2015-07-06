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
public partial class disaster_encounter_Screen : System.Web.UI.Page
{
            public disaster_encounter disaster_encounter = new disaster_encounter();
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
        disaster_encounter = Insert_disaster_encounter_select(Convert.ToInt32(Insert_disaster_encounter_GridView.SelectedValue));
    }
    public disaster_encounter Insert_disaster_encounter_select(int ID)
    {
        disaster_encounter = disaster_encounter.Select(ID);
        Insert_disaster_id_txt.Text = Convert.ToString(disaster_encounter.disaster_id);
        Insert_encounter_id_txt.Text = Convert.ToString(disaster_encounter.encounter_id);
        Insert_location_id_txt.Text = Convert.ToString(disaster_encounter.location_id);
        return disaster_encounter;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        disaster_encounter = disaster_encounter_insert();
    }
    public disaster_encounter disaster_encounter_insert()
    {
        disaster_encounter.disaster_id = Convert.ToInt32(Insert_disaster_id_txt.Text);
        disaster_encounter.encounter_id = Convert.ToInt32(Insert_encounter_id_txt.Text);
        disaster_encounter.location_id = Convert.ToInt32(Insert_location_id_txt.Text);
        disaster_encounter = disaster_encounter.Insert(disaster_encounter);
        Insert_disaster_encounter_GridView.DataBind();
        Update_disaster_encounter_GridView.DataBind();
        Delete_disaster_encounter_GridView.DataBind();
        return disaster_encounter;
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
        disaster_encounter = Update_disaster_encounter_select(Convert.ToInt32(Update_disaster_encounter_GridView.SelectedValue));
    }
    public disaster_encounter Update_disaster_encounter_select(int ID)
    {
        disaster_encounter = disaster_encounter.Select(ID);
        Update_disaster_encounter_id_txt.Text = Convert.ToString(disaster_encounter.disaster_encounter_id);
        Update_disaster_id_txt.Text = Convert.ToString(disaster_encounter.disaster_id);
        Update_encounter_id_txt.Text = Convert.ToString(disaster_encounter.encounter_id);
        Update_location_id_txt.Text = Convert.ToString(disaster_encounter.location_id);
        return disaster_encounter;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        disaster_encounter = disaster_encounter_update(Convert.ToInt32(Update_disaster_encounter_GridView.SelectedValue));
    }
    public disaster_encounter disaster_encounter_update(int ID)
    {
        disaster_encounter = disaster_encounter.Select(ID);
        disaster_encounter.disaster_encounter_id = Convert.ToInt32(Update_disaster_encounter_id_txt.Text);
        disaster_encounter.disaster_id = Convert.ToInt32(Update_disaster_id_txt.Text);
        disaster_encounter.encounter_id = Convert.ToInt32(Update_encounter_id_txt.Text);
        disaster_encounter.location_id = Convert.ToInt32(Update_location_id_txt.Text);
        disaster_encounter.Update(disaster_encounter);
        Insert_disaster_encounter_GridView.DataBind();
        Update_disaster_encounter_GridView.DataBind();
        Delete_disaster_encounter_GridView.DataBind();
        return disaster_encounter;
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
        disaster_encounter = Delete_disaster_encounter_select(Convert.ToInt32(Delete_disaster_encounter_GridView.SelectedValue));
    }
    public disaster_encounter Delete_disaster_encounter_select(int ID)
    {
        disaster_encounter = disaster_encounter.Select(ID);
        Delete_disaster_encounter_id_txt_lbl.Text = Convert.ToString(disaster_encounter.disaster_encounter_id);
        Delete_disaster_id_txt_lbl.Text = Convert.ToString(disaster_encounter.disaster_id);
        Delete_encounter_id_txt_lbl.Text = Convert.ToString(disaster_encounter.encounter_id);
        Delete_location_id_txt_lbl.Text = Convert.ToString(disaster_encounter.location_id);
        return disaster_encounter;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        disaster_encounter_delete(Convert.ToInt32(Delete_disaster_encounter_GridView.SelectedValue));
    }
    public void disaster_encounter_delete(int ID)
    {
        disaster_encounter.Delete(ID);
        Insert_disaster_encounter_GridView.DataBind();
        Update_disaster_encounter_GridView.DataBind();
        Delete_disaster_encounter_GridView.DataBind();
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

