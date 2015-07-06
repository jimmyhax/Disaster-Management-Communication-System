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
public partial class property_Screen : System.Web.UI.Page
{
            public property property = new property();
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
        property = Insert_property_select(Convert.ToInt32(Insert_property_GridView.SelectedValue));
    }
    public property Insert_property_select(int ID)
    {
        property = property.Select(ID);
        Insert_approx_mrkt_value_txt.Text = Convert.ToString(property.approx_mrkt_value);
        Insert_address_id_txt.Text = Convert.ToString(property.address_id);
        Insert_case_id_txt.Text = Convert.ToString(property.case_id);
        Insert_client_id_txt.Text = Convert.ToString(property.client_id);
        Insert_Homeowners_Insurance_Payment_txt.Text = Convert.ToString(property.Homeowners_Insurance_Payment);
        Insert_monthly_property_payment_txt.Text = Convert.ToString(property.monthly_property_payment);
        Insert_mortg_comp_txt.Text = Convert.ToString(property.mortg_comp);
        Insert_Property_Tax_Payment_txt.Text = Convert.ToString(property.Property_Tax_Payment);
        Insert_own_prop_txt.Text = Convert.ToString(property.own_prop);
        Insert_rent_prop_txt.Text = Convert.ToString(property.rent_prop);
        Insert_date_purchased_txt.Text = Convert.ToString(property.date_purchased);
        return property;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        property = property_insert();
    }
    public property property_insert()
    {
        property.approx_mrkt_value = Convert.ToDecimal(Insert_approx_mrkt_value_txt.Text);
        property.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        property.case_id = Convert.ToInt32(Insert_case_id_txt.Text);
        property.client_id = Convert.ToInt32(Insert_client_id_txt.Text);
        property.Homeowners_Insurance_Payment = Convert.ToDecimal(Insert_Homeowners_Insurance_Payment_txt.Text);
        property.monthly_property_payment = Convert.ToDecimal(Insert_monthly_property_payment_txt.Text);
        property.mortg_comp = Insert_mortg_comp_txt.Text;
        property.Property_Tax_Payment = Convert.ToDecimal(Insert_Property_Tax_Payment_txt.Text);
        property.own_prop = Insert_own_prop_txt.Text;
        property.rent_prop = Insert_rent_prop_txt.Text;
        property.date_purchased = Convert.ToInt32(Insert_date_purchased_txt.Text);
        property = property.Insert(property);
        Insert_property_GridView.DataBind();
        Update_property_GridView.DataBind();
        Delete_property_GridView.DataBind();
        return property;
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
        property = Update_property_select(Convert.ToInt32(Update_property_GridView.SelectedValue));
    }
    public property Update_property_select(int ID)
    {
        property = property.Select(ID);
        Update_property_id_txt.Text = Convert.ToString(property.property_id);
        Update_approx_mrkt_value_txt.Text = Convert.ToString(property.approx_mrkt_value);
        Update_address_id_txt.Text = Convert.ToString(property.address_id);
        Update_case_id_txt.Text = Convert.ToString(property.case_id);
        Update_client_id_txt.Text = Convert.ToString(property.client_id);
        Update_Homeowners_Insurance_Payment_txt.Text = Convert.ToString(property.Homeowners_Insurance_Payment);
        Update_monthly_property_payment_txt.Text = Convert.ToString(property.monthly_property_payment);
        Update_mortg_comp_txt.Text = Convert.ToString(property.mortg_comp);
        Update_Property_Tax_Payment_txt.Text = Convert.ToString(property.Property_Tax_Payment);
        Update_own_prop_txt.Text = Convert.ToString(property.own_prop);
        Update_rent_prop_txt.Text = Convert.ToString(property.rent_prop);
        Update_date_purchased_txt.Text = Convert.ToString(property.date_purchased);
        return property;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        property = property_update(Convert.ToInt32(Update_property_GridView.SelectedValue));
    }
    public property property_update(int ID)
    {
        property = property.Select(ID);
        property.property_id = Convert.ToInt32(Update_property_id_txt.Text);
        property.approx_mrkt_value = Convert.ToDecimal(Update_approx_mrkt_value_txt.Text);
        property.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        property.case_id = Convert.ToInt32(Update_case_id_txt.Text);
        property.client_id = Convert.ToInt32(Update_client_id_txt.Text);
        property.Homeowners_Insurance_Payment = Convert.ToDecimal(Update_Homeowners_Insurance_Payment_txt.Text);
        property.monthly_property_payment = Convert.ToDecimal(Update_monthly_property_payment_txt.Text);
        property.mortg_comp = Update_mortg_comp_txt.Text;
        property.Property_Tax_Payment = Convert.ToDecimal(Update_Property_Tax_Payment_txt.Text);
        property.own_prop = Update_own_prop_txt.Text;
        property.rent_prop = Update_rent_prop_txt.Text;
        property.date_purchased = Convert.ToInt32(Update_date_purchased_txt.Text);
        property.Update(property);
        Insert_property_GridView.DataBind();
        Update_property_GridView.DataBind();
        Delete_property_GridView.DataBind();
        return property;
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
        property = Delete_property_select(Convert.ToInt32(Delete_property_GridView.SelectedValue));
    }
    public property Delete_property_select(int ID)
    {
        property = property.Select(ID);
        Delete_property_id_txt_lbl.Text = Convert.ToString(property.property_id);
        Delete_approx_mrkt_value_txt_lbl.Text = Convert.ToString(property.approx_mrkt_value);
        Delete_address_id_txt_lbl.Text = Convert.ToString(property.address_id);
        Delete_case_id_txt_lbl.Text = Convert.ToString(property.case_id);
        Delete_client_id_txt_lbl.Text = Convert.ToString(property.client_id);
        Delete_Homeowners_Insurance_Payment_txt_lbl.Text = Convert.ToString(property.Homeowners_Insurance_Payment);
        Delete_monthly_property_payment_txt_lbl.Text = Convert.ToString(property.monthly_property_payment);
        Delete_mortg_comp_txt_lbl.Text = Convert.ToString(property.mortg_comp);
        Delete_Property_Tax_Payment_txt_lbl.Text = Convert.ToString(property.Property_Tax_Payment);
        Delete_own_prop_txt_lbl.Text = Convert.ToString(property.own_prop);
        Delete_rent_prop_txt_lbl.Text = Convert.ToString(property.rent_prop);
        Delete_date_purchased_txt_lbl.Text = Convert.ToString(property.date_purchased);
        return property;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        property_delete(Convert.ToInt32(Delete_property_GridView.SelectedValue));
    }
    public void property_delete(int ID)
    {
        property.Delete(ID);
        Insert_property_GridView.DataBind();
        Update_property_GridView.DataBind();
        Delete_property_GridView.DataBind();
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

