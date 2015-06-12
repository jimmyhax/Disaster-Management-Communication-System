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
public partial class medicine_Screen : System.Web.UI.Page
{
            public medicine medicine = new medicine();
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
        medicine = Insert_medicine_select(Convert.ToInt32(Insert_medicine_GridView.SelectedValue));
    }
    public medicine Insert_medicine_select(int ID)
    {
        medicine = medicine.Select(ID);
        Insert_Medication_type_txt.Text = Convert.ToString(medicine.Medication_type);
        Insert_Medication_name_txt.Text = Convert.ToString(medicine.Medication_name);
        Insert_Clients_Served_txt.Text = Convert.ToString(medicine.Clients_Served);
        return medicine;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        medicine = medicine_insert();
    }
    public medicine medicine_insert()
    {
        medicine.Medication_type = Insert_Medication_type_txt.Text;
        medicine.Medication_name = Insert_Medication_name_txt.Text;
        medicine.Clients_Served = Convert.ToInt32(Insert_Clients_Served_txt.Text);
        medicine = medicine.Insert(medicine);
        Insert_medicine_GridView.DataBind();
        Update_medicine_GridView.DataBind();
        Delete_medicine_GridView.DataBind();
        return medicine;
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
        medicine = Update_medicine_select(Convert.ToInt32(Update_medicine_GridView.SelectedValue));
    }
    public medicine Update_medicine_select(int ID)
    {
        medicine = medicine.Select(ID);
        Update_Medicine_Id_txt.Text = Convert.ToString(medicine.Medicine_Id);
        Update_Medication_type_txt.Text = Convert.ToString(medicine.Medication_type);
        Update_Medication_name_txt.Text = Convert.ToString(medicine.Medication_name);
        Update_Clients_Served_txt.Text = Convert.ToString(medicine.Clients_Served);
        return medicine;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        medicine = medicine_update(Convert.ToInt32(Update_medicine_GridView.SelectedValue));
    }
    public medicine medicine_update(int ID)
    {
        medicine = medicine.Select(ID);
        medicine.Medicine_Id = Convert.ToInt32(Update_Medicine_Id_txt.Text);
        medicine.Medication_type = Update_Medication_type_txt.Text;
        medicine.Medication_name = Update_Medication_name_txt.Text;
        medicine.Clients_Served = Convert.ToInt32(Update_Clients_Served_txt.Text);
        medicine.Update(medicine);
        Insert_medicine_GridView.DataBind();
        Update_medicine_GridView.DataBind();
        Delete_medicine_GridView.DataBind();
        return medicine;
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
        medicine = Delete_medicine_select(Convert.ToInt32(Delete_medicine_GridView.SelectedValue));
    }
    public medicine Delete_medicine_select(int ID)
    {
        medicine = medicine.Select(ID);
        Delete_Medicine_Id_txt_lbl.Text = Convert.ToString(medicine.Medicine_Id);
        Delete_Medication_type_txt_lbl.Text = Convert.ToString(medicine.Medication_type);
        Delete_Medication_name_txt_lbl.Text = Convert.ToString(medicine.Medication_name);
        Delete_Clients_Served_txt_lbl.Text = Convert.ToString(medicine.Clients_Served);
        return medicine;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        medicine_delete(Convert.ToInt32(Delete_medicine_GridView.SelectedValue));
    }
    public void medicine_delete(int ID)
    {
        medicine.Delete(ID);
        Insert_medicine_GridView.DataBind();
        Update_medicine_GridView.DataBind();
        Delete_medicine_GridView.DataBind();
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

