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
public partial class vaccine_Screen : System.Web.UI.Page
{
            public vaccine vaccine = new vaccine();
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
        vaccine = Insert_vaccine_select(Convert.ToInt32(Insert_vaccine_GridView.SelectedValue));
    }
    public vaccine Insert_vaccine_select(int ID)
    {
        vaccine = vaccine.Select(ID);
        Insert_medicine_id_txt.Text = Convert.ToString(vaccine.medicine_id);
        Insert_Num_of_reg_doses_txt.Text = Convert.ToString(vaccine.Num_of_reg_doses);
        Insert_vaccine_name_txt.Text = Convert.ToString(vaccine.vaccine_name);
        return vaccine;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        vaccine = vaccine_insert();
    }
    public vaccine vaccine_insert()
    {
        vaccine.medicine_id = Convert.ToInt32(Insert_medicine_id_txt.Text);
        vaccine.Num_of_reg_doses = Convert.ToInt32(Insert_Num_of_reg_doses_txt.Text);
        vaccine.vaccine_name = Insert_vaccine_name_txt.Text;
        vaccine = vaccine.Insert(vaccine);
        Insert_vaccine_GridView.DataBind();
        Update_vaccine_GridView.DataBind();
        Delete_vaccine_GridView.DataBind();
        return vaccine;
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
        vaccine = Update_vaccine_select(Convert.ToInt32(Update_vaccine_GridView.SelectedValue));
    }
    public vaccine Update_vaccine_select(int ID)
    {
        vaccine = vaccine.Select(ID);
        Update_vaccine_id_txt.Text = Convert.ToString(vaccine.vaccine_id);
        Update_medicine_id_txt.Text = Convert.ToString(vaccine.medicine_id);
        Update_Num_of_reg_doses_txt.Text = Convert.ToString(vaccine.Num_of_reg_doses);
        Update_vaccine_name_txt.Text = Convert.ToString(vaccine.vaccine_name);
        return vaccine;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        vaccine = vaccine_update(Convert.ToInt32(Update_vaccine_GridView.SelectedValue));
    }
    public vaccine vaccine_update(int ID)
    {
        vaccine = vaccine.Select(ID);
        vaccine.vaccine_id = Convert.ToInt32(Update_vaccine_id_txt.Text);
        vaccine.medicine_id = Convert.ToInt32(Update_medicine_id_txt.Text);
        vaccine.Num_of_reg_doses = Convert.ToInt32(Update_Num_of_reg_doses_txt.Text);
        vaccine.vaccine_name = Update_vaccine_name_txt.Text;
        vaccine.Update(vaccine);
        Insert_vaccine_GridView.DataBind();
        Update_vaccine_GridView.DataBind();
        Delete_vaccine_GridView.DataBind();
        return vaccine;
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
        vaccine = Delete_vaccine_select(Convert.ToInt32(Delete_vaccine_GridView.SelectedValue));
    }
    public vaccine Delete_vaccine_select(int ID)
    {
        vaccine = vaccine.Select(ID);
        Delete_vaccine_id_txt_lbl.Text = Convert.ToString(vaccine.vaccine_id);
        Delete_medicine_id_txt_lbl.Text = Convert.ToString(vaccine.medicine_id);
        Delete_Num_of_reg_doses_txt_lbl.Text = Convert.ToString(vaccine.Num_of_reg_doses);
        Delete_vaccine_name_txt_lbl.Text = Convert.ToString(vaccine.vaccine_name);
        return vaccine;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        vaccine_delete(Convert.ToInt32(Delete_vaccine_GridView.SelectedValue));
    }
    public void vaccine_delete(int ID)
    {
        vaccine.Delete(ID);
        Insert_vaccine_GridView.DataBind();
        Update_vaccine_GridView.DataBind();
        Delete_vaccine_GridView.DataBind();
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

