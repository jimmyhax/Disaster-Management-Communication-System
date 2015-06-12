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
public partial class vendor_Screen : System.Web.UI.Page
{
            public vendor vendor = new vendor();
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
        vendor = Insert_vendor_select(Convert.ToInt32(Insert_vendor_GridView.SelectedValue));
    }
    public vendor Insert_vendor_select(int ID)
    {
        vendor = vendor.Select(ID);
        Insert_vendor_name_txt.Text = Convert.ToString(vendor.vendor_name);
        Insert_phone_num_txt.Text = Convert.ToString(vendor.phone_num);
        Insert_email_txt.Text = Convert.ToString(vendor.email);
        Insert_address_id_txt.Text = Convert.ToString(vendor.address_id);
        Insert_Vendor_address2_txt.Text = Convert.ToString(vendor.Vendor_address2);
        Insert_vendor_job_assign_txt.Text = Convert.ToString(vendor.vendor_job_assign);
        Insert_vendor_start_date_txt.Text = Convert.ToString(vendor.vendor_start_date);
        Insert_vendor_end_date_txt.Text = Convert.ToString(vendor.vendor_end_date);
        Insert_vendor_meth_of_contact_txt.Text = Convert.ToString(vendor.vendor_meth_of_contact);
        Insert_vendor_status_txt.Text = Convert.ToString(vendor.vendor_status);
        Insert_vendor_meth_of_pay_txt.Text = Convert.ToString(vendor.vendor_meth_of_pay);
        Insert_vendor_type_txt.Text = Convert.ToString(vendor.vendor_type);
        Insert_vendor_comments_txt.Text = Convert.ToString(vendor.vendor_comments);
        Insert_primary_fName_txt.Text = Convert.ToString(vendor.primary_fName);
        Insert_primary_lName_txt.Text = Convert.ToString(vendor.primary_lName);
        Insert_primary_phone_txt.Text = Convert.ToString(vendor.primary_phone);
        Insert_sec_fName_txt.Text = Convert.ToString(vendor.sec_fName);
        Insert_sec_lName_txt.Text = Convert.ToString(vendor.sec_lName);
        Insert_sec_phone_txt.Text = Convert.ToString(vendor.sec_phone);
        return vendor;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        vendor = vendor_insert();
    }
    public vendor vendor_insert()
    {
        vendor.vendor_name = Insert_vendor_name_txt.Text;
        vendor.phone_num = Insert_phone_num_txt.Text;
        vendor.email = Insert_email_txt.Text;
        vendor.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        vendor.Vendor_address2 = Convert.ToInt32(Insert_Vendor_address2_txt.Text);
        vendor.vendor_job_assign = Insert_vendor_job_assign_txt.Text;
        vendor.vendor_start_date = Convert.ToDateTime(Insert_vendor_start_date_txt.Text);
        vendor.vendor_end_date = Convert.ToDateTime(Insert_vendor_end_date_txt.Text);
        vendor.vendor_meth_of_contact = Insert_vendor_meth_of_contact_txt.Text;
        vendor.vendor_status = Insert_vendor_status_txt.Text;
        vendor.vendor_meth_of_pay = Insert_vendor_meth_of_pay_txt.Text;
        vendor.vendor_type = Insert_vendor_type_txt.Text;
        vendor.vendor_comments = Insert_vendor_comments_txt.Text;
        vendor.primary_fName = Insert_primary_fName_txt.Text;
        vendor.primary_lName = Insert_primary_lName_txt.Text;
        vendor.primary_phone = Insert_primary_phone_txt.Text;
        vendor.sec_fName = Insert_sec_fName_txt.Text;
        vendor.sec_lName = Insert_sec_lName_txt.Text;
        vendor.sec_phone = Insert_sec_phone_txt.Text;
        vendor = vendor.Insert(vendor);
        Insert_vendor_GridView.DataBind();
        Update_vendor_GridView.DataBind();
        Delete_vendor_GridView.DataBind();
        return vendor;
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
        vendor = Update_vendor_select(Convert.ToInt32(Update_vendor_GridView.SelectedValue));
    }
    public vendor Update_vendor_select(int ID)
    {
        vendor = vendor.Select(ID);
        Update_vendor_id_txt.Text = Convert.ToString(vendor.vendor_id);
        Update_vendor_name_txt.Text = Convert.ToString(vendor.vendor_name);
        Update_phone_num_txt.Text = Convert.ToString(vendor.phone_num);
        Update_email_txt.Text = Convert.ToString(vendor.email);
        Update_address_id_txt.Text = Convert.ToString(vendor.address_id);
        Update_Vendor_address2_txt.Text = Convert.ToString(vendor.Vendor_address2);
        Update_vendor_job_assign_txt.Text = Convert.ToString(vendor.vendor_job_assign);
        Update_vendor_start_date_txt.Text = Convert.ToString(vendor.vendor_start_date);
        Update_vendor_end_date_txt.Text = Convert.ToString(vendor.vendor_end_date);
        Update_vendor_meth_of_contact_txt.Text = Convert.ToString(vendor.vendor_meth_of_contact);
        Update_vendor_status_txt.Text = Convert.ToString(vendor.vendor_status);
        Update_vendor_meth_of_pay_txt.Text = Convert.ToString(vendor.vendor_meth_of_pay);
        Update_vendor_type_txt.Text = Convert.ToString(vendor.vendor_type);
        Update_vendor_comments_txt.Text = Convert.ToString(vendor.vendor_comments);
        Update_primary_fName_txt.Text = Convert.ToString(vendor.primary_fName);
        Update_primary_lName_txt.Text = Convert.ToString(vendor.primary_lName);
        Update_primary_phone_txt.Text = Convert.ToString(vendor.primary_phone);
        Update_sec_fName_txt.Text = Convert.ToString(vendor.sec_fName);
        Update_sec_lName_txt.Text = Convert.ToString(vendor.sec_lName);
        Update_sec_phone_txt.Text = Convert.ToString(vendor.sec_phone);
        return vendor;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        vendor = vendor_update(Convert.ToInt32(Update_vendor_GridView.SelectedValue));
    }
    public vendor vendor_update(int ID)
    {
        vendor = vendor.Select(ID);
        vendor.vendor_id = Convert.ToInt32(Update_vendor_id_txt.Text);
        vendor.vendor_name = Update_vendor_name_txt.Text;
        vendor.phone_num = Update_phone_num_txt.Text;
        vendor.email = Update_email_txt.Text;
        vendor.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        vendor.Vendor_address2 = Convert.ToInt32(Update_Vendor_address2_txt.Text);
        vendor.vendor_job_assign = Update_vendor_job_assign_txt.Text;
        vendor.vendor_start_date = Convert.ToDateTime(Update_vendor_start_date_txt.Text);
        vendor.vendor_end_date = Convert.ToDateTime(Update_vendor_end_date_txt.Text);
        vendor.vendor_meth_of_contact = Update_vendor_meth_of_contact_txt.Text;
        vendor.vendor_status = Update_vendor_status_txt.Text;
        vendor.vendor_meth_of_pay = Update_vendor_meth_of_pay_txt.Text;
        vendor.vendor_type = Update_vendor_type_txt.Text;
        vendor.vendor_comments = Update_vendor_comments_txt.Text;
        vendor.primary_fName = Update_primary_fName_txt.Text;
        vendor.primary_lName = Update_primary_lName_txt.Text;
        vendor.primary_phone = Update_primary_phone_txt.Text;
        vendor.sec_fName = Update_sec_fName_txt.Text;
        vendor.sec_lName = Update_sec_lName_txt.Text;
        vendor.sec_phone = Update_sec_phone_txt.Text;
        vendor.Update(vendor);
        Insert_vendor_GridView.DataBind();
        Update_vendor_GridView.DataBind();
        Delete_vendor_GridView.DataBind();
        return vendor;
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
        vendor = Delete_vendor_select(Convert.ToInt32(Delete_vendor_GridView.SelectedValue));
    }
    public vendor Delete_vendor_select(int ID)
    {
        vendor = vendor.Select(ID);
        Delete_vendor_id_txt_lbl.Text = Convert.ToString(vendor.vendor_id);
        Delete_vendor_name_txt_lbl.Text = Convert.ToString(vendor.vendor_name);
        Delete_phone_num_txt_lbl.Text = Convert.ToString(vendor.phone_num);
        Delete_email_txt_lbl.Text = Convert.ToString(vendor.email);
        Delete_address_id_txt_lbl.Text = Convert.ToString(vendor.address_id);
        Delete_Vendor_address2_txt_lbl.Text = Convert.ToString(vendor.Vendor_address2);
        Delete_vendor_job_assign_txt_lbl.Text = Convert.ToString(vendor.vendor_job_assign);
        Delete_vendor_start_date_txt_lbl.Text = Convert.ToString(vendor.vendor_start_date);
        Delete_vendor_end_date_txt_lbl.Text = Convert.ToString(vendor.vendor_end_date);
        Delete_vendor_meth_of_contact_txt_lbl.Text = Convert.ToString(vendor.vendor_meth_of_contact);
        Delete_vendor_status_txt_lbl.Text = Convert.ToString(vendor.vendor_status);
        Delete_vendor_meth_of_pay_txt_lbl.Text = Convert.ToString(vendor.vendor_meth_of_pay);
        Delete_vendor_type_txt_lbl.Text = Convert.ToString(vendor.vendor_type);
        Delete_vendor_comments_txt_lbl.Text = Convert.ToString(vendor.vendor_comments);
        Delete_primary_fName_txt_lbl.Text = Convert.ToString(vendor.primary_fName);
        Delete_primary_lName_txt_lbl.Text = Convert.ToString(vendor.primary_lName);
        Delete_primary_phone_txt_lbl.Text = Convert.ToString(vendor.primary_phone);
        Delete_sec_fName_txt_lbl.Text = Convert.ToString(vendor.sec_fName);
        Delete_sec_lName_txt_lbl.Text = Convert.ToString(vendor.sec_lName);
        Delete_sec_phone_txt_lbl.Text = Convert.ToString(vendor.sec_phone);
        return vendor;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        vendor_delete(Convert.ToInt32(Delete_vendor_GridView.SelectedValue));
    }
    public void vendor_delete(int ID)
    {
        vendor.Delete(ID);
        Insert_vendor_GridView.DataBind();
        Update_vendor_GridView.DataBind();
        Delete_vendor_GridView.DataBind();
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

