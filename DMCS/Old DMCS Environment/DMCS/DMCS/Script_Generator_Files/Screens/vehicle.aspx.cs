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
public partial class vehicle_ : System.Web.UI.Page
{
            public vehicle vehicle = new vehicle();
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
        vehicle = Insert_vehicle_select(Convert.ToInt32(Insert_vehicle_GridView.SelectedValue));
    }
    public vehicle Insert_vehicle_select(int ID)
    {
        vehicle = vehicle.Select(ID);
        Insert_vehicle_brand_txt.Text = Convert.ToString(vehicle.vehicle_brand);
        Insert_vehicle_model_txt.Text = Convert.ToString(vehicle.vehicle_model);
        Insert_vehicle_year_txt.Text = Convert.ToString(vehicle.vehicle_year);
        Insert_vehicle_description_txt.Text = Convert.ToString(vehicle.vehicle_description);
        return vehicle;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        vehicle = vehicle_insert();
    }
    public vehicle vehicle_insert()
    {
        vehicle = vehicle.Insert(vehicle);
        Insert_vehicle_GridView.DataBind();
        Update_vehicle_GridView.DataBind();
        Delete_vehicle_GridView.DataBind();
        return vehicle;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        vehicle = Update_vehicle_select(Convert.ToInt32(Update_vehicle_GridView.SelectedValue));
    }
    public vehicle Update_vehicle_select(int ID)
    {
        vehicle = vehicle.Select(ID);
        Update_vehicle_id_txt.Text = Convert.ToString(vehicle.vehicle_id);
        Update_vehicle_brand_txt.Text = Convert.ToString(vehicle.vehicle_brand);
        Update_vehicle_model_txt.Text = Convert.ToString(vehicle.vehicle_model);
        Update_vehicle_year_txt.Text = Convert.ToString(vehicle.vehicle_year);
        Update_vehicle_description_txt.Text = Convert.ToString(vehicle.vehicle_description);
        return vehicle;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        vehicle = vehicle_update(Convert.ToInt32(Update_vehicle_GridView.SelectedValue));
    }
    public vehicle vehicle_update(int ID)
    {
        vehicle = vehicle.Select(ID);
        vehicle.vehicle_id = Convert.ToInt32(Update_vehicle_id_txt.Text);
        vehicle.Update(vehicle);
        Insert_vehicle_GridView.DataBind();
        Update_vehicle_GridView.DataBind();
        Delete_vehicle_GridView.DataBind();
        return vehicle;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        vehicle = Delete_vehicle_select(Convert.ToInt32(Delete_vehicle_GridView.SelectedValue));
    }
    public vehicle Delete_vehicle_select(int ID)
    {
        vehicle = vehicle.Select(ID);
        Delete_vehicle_id_txt_lbl.Text = Convert.ToString(vehicle.vehicle_id);
        Delete_vehicle_brand_txt_lbl.Text = Convert.ToString(vehicle.vehicle_brand);
        Delete_vehicle_model_txt_lbl.Text = Convert.ToString(vehicle.vehicle_model);
        Delete_vehicle_year_txt_lbl.Text = Convert.ToString(vehicle.vehicle_year);
        Delete_vehicle_description_txt_lbl.Text = Convert.ToString(vehicle.vehicle_description);
        return vehicle;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        vehicle_delete(Convert.ToInt32(Delete_vehicle_GridView.SelectedValue));
    }
    public void vehicle_delete(int ID)
    {
        vehicle.Delete(ID);
        Insert_vehicle_GridView.DataBind();
        Update_vehicle_GridView.DataBind();
        Delete_vehicle_GridView.DataBind();
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

