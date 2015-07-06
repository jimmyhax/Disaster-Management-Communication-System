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

namespace DMCS
{
public partial class personDMCS_ : System.Web.UI.Page
{
            public personDMCS personDMCS = new personDMCS();
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
    protected void Insert_Select_Record(object sender, EventArgs e)
    {
        personDMCS = Insert_personDMCS_select(Convert.ToInt32(Insert_personDMCS_GridView.SelectedValue));
    }
    public personDMCS Insert_personDMCS_select(int ID)
    {
        personDMCS = personDMCS.Select(ID);
        Insert_Resource_ID_txt.Text = Convert.ToString(personDMCS.Resource_ID);
        Insert_f_name_txt.Text = Convert.ToString(personDMCS.f_name);
        Insert_l_name_txt.Text = Convert.ToString(personDMCS.l_name);
        Insert_address_txt.Text = Convert.ToString(personDMCS.address);
        Insert_city_txt.Text = Convert.ToString(personDMCS.city);
        Insert_state_txt.Text = Convert.ToString(personDMCS.state);
        Insert_zipcode_txt.Text = Convert.ToString(personDMCS.zipcode);
        Insert_phone_primary_txt.Text = Convert.ToString(personDMCS.phone_primary);
        Insert_email_txt.Text = Convert.ToString(personDMCS.email);
        Insert_creditcard_txt.Text = Convert.ToString(personDMCS.creditcard);
        Insert_availability_date_txt.Text = Convert.ToString(personDMCS.availability_date);
        Insert_availability_hours_txt.Text = Convert.ToString(personDMCS.availability_hours);
        Insert_birthdate_txt.Text = Convert.ToString(personDMCS.birthdate);
        Insert_marital_status_txt.Text = Convert.ToString(personDMCS.marital_status);
        Insert_gender_txt.Text = Convert.ToString(personDMCS.gender);
        Insert_jobtitle_txt.Text = Convert.ToString(personDMCS.jobtitle);
        Insert_workdate_txt.Text = Convert.ToString(personDMCS.workdate);
        Insert_regpay_txt.Text = Convert.ToString(personDMCS.regpay);
        Insert_OT_txt.Text = Convert.ToString(personDMCS.OT);
        Insert_OT_rate_txt.Text = Convert.ToString(personDMCS.OT_rate);
        Insert_hourly_rate_txt.Text = Convert.ToString(personDMCS.hourly_rate);
        return personDMCS;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        personDMCS = personDMCS_insert();
    }
    public personDMCS personDMCS_insert()
    {
        personDMCS.Resource_ID = Convert.ToInt32(Insert_Resource_ID_txt.Text);
        personDMCS.f_name = Insert_f_name_txt.Text;
        personDMCS.l_name = Insert_l_name_txt.Text;
        personDMCS.address = Insert_address_txt.Text;
        personDMCS.city = Insert_city_txt.Text;
        personDMCS.state = Insert_state_txt.Text;
        personDMCS.zipcode = Convert.ToInt32(Insert_zipcode_txt.Text);
        personDMCS.phone_primary = Insert_phone_primary_txt.Text;
        personDMCS.email = Insert_email_txt.Text;
        personDMCS.creditcard = Insert_creditcard_txt.Text;
        personDMCS.availability_date = Convert.ToDateTime(Insert_availability_date_txt.Text);
        personDMCS.availability_hours = Convert.ToInt32(Insert_availability_hours_txt.Text);
        personDMCS.birthdate = Convert.ToDateTime(Insert_birthdate_txt.Text);
        personDMCS.marital_status = Insert_marital_status_txt.Text;
        personDMCS.gender = Insert_gender_txt.Text;
        personDMCS.jobtitle = Insert_jobtitle_txt.Text;
        personDMCS.workdate = Convert.ToDateTime(Insert_workdate_txt.Text);
        personDMCS.regpay = Convert.ToDecimal(Insert_regpay_txt.Text);
        personDMCS.OT = Convert.ToInt32(Insert_OT_txt.Text);
        personDMCS.OT_rate = Convert.ToDecimal(Insert_OT_rate_txt.Text);
        personDMCS.hourly_rate = Convert.ToDecimal(Insert_hourly_rate_txt.Text);
        personDMCS = personDMCS.Insert(personDMCS);
        Insert_personDMCS_GridView.DataBind();
        Update_personDMCS_GridView.DataBind();
        Delete_personDMCS_GridView.DataBind();
        return personDMCS;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        personDMCS = Update_personDMCS_select(Convert.ToInt32(Update_personDMCS_GridView.SelectedValue));
    }
    public personDMCS Update_personDMCS_select(int ID)
    {
        personDMCS = personDMCS.Select(ID);
        Update_Person_ID_txt.Text = Convert.ToString(personDMCS.Person_ID);
        Update_Resource_ID_txt.Text = Convert.ToString(personDMCS.Resource_ID);
        Update_f_name_txt.Text = Convert.ToString(personDMCS.f_name);
        Update_l_name_txt.Text = Convert.ToString(personDMCS.l_name);
        Update_address_txt.Text = Convert.ToString(personDMCS.address);
        Update_city_txt.Text = Convert.ToString(personDMCS.city);
        Update_state_txt.Text = Convert.ToString(personDMCS.state);
        Update_zipcode_txt.Text = Convert.ToString(personDMCS.zipcode);
        Update_phone_primary_txt.Text = Convert.ToString(personDMCS.phone_primary);
        Update_email_txt.Text = Convert.ToString(personDMCS.email);
        Update_creditcard_txt.Text = Convert.ToString(personDMCS.creditcard);
        Update_availability_date_txt.Text = Convert.ToString(personDMCS.availability_date);
        Update_availability_hours_txt.Text = Convert.ToString(personDMCS.availability_hours);
        Update_birthdate_txt.Text = Convert.ToString(personDMCS.birthdate);
        Update_marital_status_txt.Text = Convert.ToString(personDMCS.marital_status);
        Update_gender_txt.Text = Convert.ToString(personDMCS.gender);
        Update_jobtitle_txt.Text = Convert.ToString(personDMCS.jobtitle);
        Update_workdate_txt.Text = Convert.ToString(personDMCS.workdate);
        Update_regpay_txt.Text = Convert.ToString(personDMCS.regpay);
        Update_OT_txt.Text = Convert.ToString(personDMCS.OT);
        Update_OT_rate_txt.Text = Convert.ToString(personDMCS.OT_rate);
        Update_hourly_rate_txt.Text = Convert.ToString(personDMCS.hourly_rate);
        return personDMCS;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        personDMCS = personDMCS_update(Convert.ToInt32(Update_personDMCS_GridView.SelectedValue));
    }
    public personDMCS personDMCS_update(int ID)
    {
        personDMCS = personDMCS.Select(ID);
        personDMCS.Person_ID = Convert.ToInt32(Update_Person_ID_txt.Text);
        personDMCS.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        personDMCS.f_name = Update_f_name_txt.Text;
        personDMCS.l_name = Update_l_name_txt.Text;
        personDMCS.address = Update_address_txt.Text;
        personDMCS.city = Update_city_txt.Text;
        personDMCS.state = Update_state_txt.Text;
        personDMCS.zipcode = Convert.ToInt32(Update_zipcode_txt.Text);
        personDMCS.phone_primary = Update_phone_primary_txt.Text;
        personDMCS.email = Update_email_txt.Text;
        personDMCS.creditcard = Update_creditcard_txt.Text;
        personDMCS.availability_date = Convert.ToDateTime(Update_availability_date_txt.Text);
        personDMCS.availability_hours = Convert.ToInt32(Update_availability_hours_txt.Text);
        personDMCS.birthdate = Convert.ToDateTime(Update_birthdate_txt.Text);
        personDMCS.marital_status = Update_marital_status_txt.Text;
        personDMCS.gender = Update_gender_txt.Text;
        personDMCS.jobtitle = Update_jobtitle_txt.Text;
        personDMCS.workdate = Convert.ToDateTime(Update_workdate_txt.Text);
        personDMCS.regpay = Convert.ToDecimal(Update_regpay_txt.Text);
        personDMCS.OT = Convert.ToInt32(Update_OT_txt.Text);
        personDMCS.OT_rate = Convert.ToDecimal(Update_OT_rate_txt.Text);
        personDMCS.hourly_rate = Convert.ToDecimal(Update_hourly_rate_txt.Text);
        personDMCS.Update(personDMCS);
        Insert_personDMCS_GridView.DataBind();
        Update_personDMCS_GridView.DataBind();
        Delete_personDMCS_GridView.DataBind();
        return personDMCS;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        personDMCS = Delete_personDMCS_select(Convert.ToInt32(Delete_personDMCS_GridView.SelectedValue));
    }
    public personDMCS Delete_personDMCS_select(int ID)
    {
        personDMCS = personDMCS.Select(ID);
        Delete_Person_ID_txt_lbl.Text = Convert.ToString(personDMCS.Person_ID);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(personDMCS.Resource_ID);
        Delete_f_name_txt_lbl.Text = Convert.ToString(personDMCS.f_name);
        Delete_l_name_txt_lbl.Text = Convert.ToString(personDMCS.l_name);
        Delete_address_txt_lbl.Text = Convert.ToString(personDMCS.address);
        Delete_city_txt_lbl.Text = Convert.ToString(personDMCS.city);
        Delete_state_txt_lbl.Text = Convert.ToString(personDMCS.state);
        Delete_zipcode_txt_lbl.Text = Convert.ToString(personDMCS.zipcode);
        Delete_phone_primary_txt_lbl.Text = Convert.ToString(personDMCS.phone_primary);
        Delete_email_txt_lbl.Text = Convert.ToString(personDMCS.email);
        Delete_creditcard_txt_lbl.Text = Convert.ToString(personDMCS.creditcard);
        Delete_availability_date_txt_lbl.Text = Convert.ToString(personDMCS.availability_date);
        Delete_availability_hours_txt_lbl.Text = Convert.ToString(personDMCS.availability_hours);
        Delete_birthdate_txt_lbl.Text = Convert.ToString(personDMCS.birthdate);
        Delete_marital_status_txt_lbl.Text = Convert.ToString(personDMCS.marital_status);
        Delete_gender_txt_lbl.Text = Convert.ToString(personDMCS.gender);
        Delete_jobtitle_txt_lbl.Text = Convert.ToString(personDMCS.jobtitle);
        Delete_workdate_txt_lbl.Text = Convert.ToString(personDMCS.workdate);
        Delete_regpay_txt_lbl.Text = Convert.ToString(personDMCS.regpay);
        Delete_OT_txt_lbl.Text = Convert.ToString(personDMCS.OT);
        Delete_OT_rate_txt_lbl.Text = Convert.ToString(personDMCS.OT_rate);
        Delete_hourly_rate_txt_lbl.Text = Convert.ToString(personDMCS.hourly_rate);
        return personDMCS;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        personDMCS_delete(Convert.ToInt32(Delete_personDMCS_GridView.SelectedValue));
    }
    public void personDMCS_delete(int ID)
    {
        personDMCS.Delete(ID);
        Insert_personDMCS_GridView.DataBind();
        Update_personDMCS_GridView.DataBind();
        Delete_personDMCS_GridView.DataBind();
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

