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
public partial class deceased_Screen : System.Web.UI.Page
{
            public deceased deceased = new deceased();
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
        deceased = Insert_deceased_select(Convert.ToInt32(Insert_deceased_GridView.SelectedValue));
    }
    public deceased Insert_deceased_select(int ID)
    {
        deceased = deceased.Select(ID);
        Insert_date_of_autopsy_txt.Text = Convert.ToString(deceased.date_of_autopsy);
        Insert_external_exam_txt.Text = Convert.ToString(deceased.external_exam);
        Insert_identifying_marks_txt.Text = Convert.ToString(deceased.identifying_marks);
        Insert_internal_exam_txt.Text = Convert.ToString(deceased.internal_exam);
        Insert_reason_of_death_txt.Text = Convert.ToString(deceased.reason_of_death);
        Insert_time_of_death_txt.Text = Convert.ToString(deceased.time_of_death);
        return deceased;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        deceased = deceased_insert();
    }
    public deceased deceased_insert()
    {
        deceased.date_of_autopsy = Convert.ToDateTime(Insert_date_of_autopsy_txt.Text);
        deceased.external_exam = Insert_external_exam_txt.Text;
        deceased.identifying_marks = Insert_identifying_marks_txt.Text;
        deceased.internal_exam = Insert_internal_exam_txt.Text;
        deceased.reason_of_death = Insert_reason_of_death_txt.Text;
        deceased.time_of_death = Convert.ToDateTime(Insert_time_of_death_txt.Text);
        deceased = deceased.Insert(deceased);
        Insert_deceased_GridView.DataBind();
        Update_deceased_GridView.DataBind();
        Delete_deceased_GridView.DataBind();
        return deceased;
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
        deceased = Update_deceased_select(Convert.ToInt32(Update_deceased_GridView.SelectedValue));
    }
    public deceased Update_deceased_select(int ID)
    {
        deceased = deceased.Select(ID);
        Update_deceased_id_txt.Text = Convert.ToString(deceased.deceased_id);
        Update_date_of_autopsy_txt.Text = Convert.ToString(deceased.date_of_autopsy);
        Update_external_exam_txt.Text = Convert.ToString(deceased.external_exam);
        Update_identifying_marks_txt.Text = Convert.ToString(deceased.identifying_marks);
        Update_internal_exam_txt.Text = Convert.ToString(deceased.internal_exam);
        Update_reason_of_death_txt.Text = Convert.ToString(deceased.reason_of_death);
        Update_time_of_death_txt.Text = Convert.ToString(deceased.time_of_death);
        return deceased;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        deceased = deceased_update(Convert.ToInt32(Update_deceased_GridView.SelectedValue));
    }
    public deceased deceased_update(int ID)
    {
        deceased = deceased.Select(ID);
        deceased.deceased_id = Convert.ToInt32(Update_deceased_id_txt.Text);
        deceased.date_of_autopsy = Convert.ToDateTime(Update_date_of_autopsy_txt.Text);
        deceased.external_exam = Update_external_exam_txt.Text;
        deceased.identifying_marks = Update_identifying_marks_txt.Text;
        deceased.internal_exam = Update_internal_exam_txt.Text;
        deceased.reason_of_death = Update_reason_of_death_txt.Text;
        deceased.time_of_death = Convert.ToDateTime(Update_time_of_death_txt.Text);
        deceased.Update(deceased);
        Insert_deceased_GridView.DataBind();
        Update_deceased_GridView.DataBind();
        Delete_deceased_GridView.DataBind();
        return deceased;
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
        deceased = Delete_deceased_select(Convert.ToInt32(Delete_deceased_GridView.SelectedValue));
    }
    public deceased Delete_deceased_select(int ID)
    {
        deceased = deceased.Select(ID);
        Delete_deceased_id_txt_lbl.Text = Convert.ToString(deceased.deceased_id);
        Delete_date_of_autopsy_txt_lbl.Text = Convert.ToString(deceased.date_of_autopsy);
        Delete_external_exam_txt_lbl.Text = Convert.ToString(deceased.external_exam);
        Delete_identifying_marks_txt_lbl.Text = Convert.ToString(deceased.identifying_marks);
        Delete_internal_exam_txt_lbl.Text = Convert.ToString(deceased.internal_exam);
        Delete_reason_of_death_txt_lbl.Text = Convert.ToString(deceased.reason_of_death);
        Delete_time_of_death_txt_lbl.Text = Convert.ToString(deceased.time_of_death);
        return deceased;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        deceased_delete(Convert.ToInt32(Delete_deceased_GridView.SelectedValue));
    }
    public void deceased_delete(int ID)
    {
        deceased.Delete(ID);
        Insert_deceased_GridView.DataBind();
        Update_deceased_GridView.DataBind();
        Delete_deceased_GridView.DataBind();
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

