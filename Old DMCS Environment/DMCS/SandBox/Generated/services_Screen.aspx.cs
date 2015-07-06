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
public partial class services_Screen : System.Web.UI.Page
{
            public services services = new services();
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
        services = Insert_services_select(Convert.ToInt32(Insert_services_GridView.SelectedValue));
    }
    public services Insert_services_select(int ID)
    {
        services = services.Select(ID);
        Insert_Company_txt.Text = Convert.ToString(services.Company);
        Insert_service_type_txt.Text = Convert.ToString(services.service_type);
        Insert_Estimated_Time_txt.Text = Convert.ToString(services.Estimated_Time);
        Insert_Email_txt.Text = Convert.ToString(services.Email);
        Insert_Phone_Number_txt.Text = Convert.ToString(services.Phone_Number);
        Insert_Full_Cost_txt.Text = Convert.ToString(services.Full_Cost);
        Insert_Estimated_Cost_txt.Text = Convert.ToString(services.Estimated_Cost);
        return services;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        services = services_insert();
    }
    public services services_insert()
    {
        services.Company = Insert_Company_txt.Text;
        services.service_type = Insert_service_type_txt.Text;
        services.Estimated_Time = Convert.ToDateTime(Insert_Estimated_Time_txt.Text);
        services.Email = Insert_Email_txt.Text;
        services.Phone_Number = Convert.ToInt32(Insert_Phone_Number_txt.Text);
        services.Full_Cost = Convert.ToInt32(Insert_Full_Cost_txt.Text);
        services.Estimated_Cost = Convert.ToInt32(Insert_Estimated_Cost_txt.Text);
        services = services.Insert(services);
        Insert_services_GridView.DataBind();
        Update_services_GridView.DataBind();
        Delete_services_GridView.DataBind();
        return services;
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
        services = Update_services_select(Convert.ToInt32(Update_services_GridView.SelectedValue));
    }
    public services Update_services_select(int ID)
    {
        services = services.Select(ID);
        Update_service_id_txt.Text = Convert.ToString(services.service_id);
        Update_Company_txt.Text = Convert.ToString(services.Company);
        Update_service_type_txt.Text = Convert.ToString(services.service_type);
        Update_Estimated_Time_txt.Text = Convert.ToString(services.Estimated_Time);
        Update_Email_txt.Text = Convert.ToString(services.Email);
        Update_Phone_Number_txt.Text = Convert.ToString(services.Phone_Number);
        Update_Full_Cost_txt.Text = Convert.ToString(services.Full_Cost);
        Update_Estimated_Cost_txt.Text = Convert.ToString(services.Estimated_Cost);
        return services;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        services = services_update(Convert.ToInt32(Update_services_GridView.SelectedValue));
    }
    public services services_update(int ID)
    {
        services = services.Select(ID);
        services.service_id = Convert.ToInt32(Update_service_id_txt.Text);
        services.Company = Update_Company_txt.Text;
        services.service_type = Update_service_type_txt.Text;
        services.Estimated_Time = Convert.ToDateTime(Update_Estimated_Time_txt.Text);
        services.Email = Update_Email_txt.Text;
        services.Phone_Number = Convert.ToInt32(Update_Phone_Number_txt.Text);
        services.Full_Cost = Convert.ToInt32(Update_Full_Cost_txt.Text);
        services.Estimated_Cost = Convert.ToInt32(Update_Estimated_Cost_txt.Text);
        services.Update(services);
        Insert_services_GridView.DataBind();
        Update_services_GridView.DataBind();
        Delete_services_GridView.DataBind();
        return services;
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
        services = Delete_services_select(Convert.ToInt32(Delete_services_GridView.SelectedValue));
    }
    public services Delete_services_select(int ID)
    {
        services = services.Select(ID);
        Delete_service_id_txt_lbl.Text = Convert.ToString(services.service_id);
        Delete_Company_txt_lbl.Text = Convert.ToString(services.Company);
        Delete_service_type_txt_lbl.Text = Convert.ToString(services.service_type);
        Delete_Estimated_Time_txt_lbl.Text = Convert.ToString(services.Estimated_Time);
        Delete_Email_txt_lbl.Text = Convert.ToString(services.Email);
        Delete_Phone_Number_txt_lbl.Text = Convert.ToString(services.Phone_Number);
        Delete_Full_Cost_txt_lbl.Text = Convert.ToString(services.Full_Cost);
        Delete_Estimated_Cost_txt_lbl.Text = Convert.ToString(services.Estimated_Cost);
        return services;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        services_delete(Convert.ToInt32(Delete_services_GridView.SelectedValue));
    }
    public void services_delete(int ID)
    {
        services.Delete(ID);
        Insert_services_GridView.DataBind();
        Update_services_GridView.DataBind();
        Delete_services_GridView.DataBind();
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

