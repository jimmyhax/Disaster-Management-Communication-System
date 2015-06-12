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
public partial class transportation_Screen : System.Web.UI.Page
{
            public transportation transportation = new transportation();
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
        transportation = Insert_transportation_select(Convert.ToInt32(Insert_transportation_GridView.SelectedValue));
    }
    public transportation Insert_transportation_select(int ID)
    {
        transportation = transportation.Select(ID);
        Insert_location_from_txt.Text = Convert.ToString(transportation.location_from);
        Insert_location_to_txt.Text = Convert.ToString(transportation.location_to);
        Insert_no_of_passangers_txt.Text = Convert.ToString(transportation.no_of_passangers);
        Insert_pickup_date_txt.Text = Convert.ToString(transportation.pickup_date);
        Insert_trans_type_txt.Text = Convert.ToString(transportation.trans_type);
        Insert_Vehicle_id_txt.Text = Convert.ToString(transportation.Vehicle_id);
        return transportation;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        transportation = transportation_insert();
    }
    public transportation transportation_insert()
    {
        transportation.location_from = Insert_location_from_txt.Text;
        transportation.location_to = Insert_location_to_txt.Text;
        transportation.no_of_passangers = Convert.ToInt32(Insert_no_of_passangers_txt.Text);
        transportation.pickup_date = Convert.ToDateTime(Insert_pickup_date_txt.Text);
        transportation.trans_type = Insert_trans_type_txt.Text;
        transportation.Vehicle_id = Convert.ToInt32(Insert_Vehicle_id_txt.Text);
        transportation = transportation.Insert(transportation);
        Insert_transportation_GridView.DataBind();
        Update_transportation_GridView.DataBind();
        Delete_transportation_GridView.DataBind();
        return transportation;
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
        transportation = Update_transportation_select(Convert.ToInt32(Update_transportation_GridView.SelectedValue));
    }
    public transportation Update_transportation_select(int ID)
    {
        transportation = transportation.Select(ID);
        Update_transport_id_txt.Text = Convert.ToString(transportation.transport_id);
        Update_location_from_txt.Text = Convert.ToString(transportation.location_from);
        Update_location_to_txt.Text = Convert.ToString(transportation.location_to);
        Update_no_of_passangers_txt.Text = Convert.ToString(transportation.no_of_passangers);
        Update_pickup_date_txt.Text = Convert.ToString(transportation.pickup_date);
        Update_trans_type_txt.Text = Convert.ToString(transportation.trans_type);
        Update_Vehicle_id_txt.Text = Convert.ToString(transportation.Vehicle_id);
        return transportation;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        transportation = transportation_update(Convert.ToInt32(Update_transportation_GridView.SelectedValue));
    }
    public transportation transportation_update(int ID)
    {
        transportation = transportation.Select(ID);
        transportation.transport_id = Convert.ToInt32(Update_transport_id_txt.Text);
        transportation.location_from = Update_location_from_txt.Text;
        transportation.location_to = Update_location_to_txt.Text;
        transportation.no_of_passangers = Convert.ToInt32(Update_no_of_passangers_txt.Text);
        transportation.pickup_date = Convert.ToDateTime(Update_pickup_date_txt.Text);
        transportation.trans_type = Update_trans_type_txt.Text;
        transportation.Vehicle_id = Convert.ToInt32(Update_Vehicle_id_txt.Text);
        transportation.Update(transportation);
        Insert_transportation_GridView.DataBind();
        Update_transportation_GridView.DataBind();
        Delete_transportation_GridView.DataBind();
        return transportation;
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
        transportation = Delete_transportation_select(Convert.ToInt32(Delete_transportation_GridView.SelectedValue));
    }
    public transportation Delete_transportation_select(int ID)
    {
        transportation = transportation.Select(ID);
        Delete_transport_id_txt_lbl.Text = Convert.ToString(transportation.transport_id);
        Delete_location_from_txt_lbl.Text = Convert.ToString(transportation.location_from);
        Delete_location_to_txt_lbl.Text = Convert.ToString(transportation.location_to);
        Delete_no_of_passangers_txt_lbl.Text = Convert.ToString(transportation.no_of_passangers);
        Delete_pickup_date_txt_lbl.Text = Convert.ToString(transportation.pickup_date);
        Delete_trans_type_txt_lbl.Text = Convert.ToString(transportation.trans_type);
        Delete_Vehicle_id_txt_lbl.Text = Convert.ToString(transportation.Vehicle_id);
        return transportation;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        transportation_delete(Convert.ToInt32(Delete_transportation_GridView.SelectedValue));
    }
    public void transportation_delete(int ID)
    {
        transportation.Delete(ID);
        Insert_transportation_GridView.DataBind();
        Update_transportation_GridView.DataBind();
        Delete_transportation_GridView.DataBind();
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

