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
public partial class mobile_unit_Screen : System.Web.UI.Page
{
            public mobile_unit mobile_unit = new mobile_unit();
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
        mobile_unit = Insert_mobile_unit_select(Convert.ToInt32(Insert_mobile_unit_GridView.SelectedValue));
    }
    public mobile_unit Insert_mobile_unit_select(int ID)
    {
        mobile_unit = mobile_unit.Select(ID);
        Insert_vehicle_id_txt.Text = Convert.ToString(mobile_unit.vehicle_id);
        Insert_mobile_desc_txt.Text = Convert.ToString(mobile_unit.mobile_desc);
        Insert_call_center_id_txt.Text = Convert.ToString(mobile_unit.call_center_id);
        return mobile_unit;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        mobile_unit = mobile_unit_insert();
    }
    public mobile_unit mobile_unit_insert()
    {
        mobile_unit.vehicle_id = Convert.ToInt32(Insert_vehicle_id_txt.Text);
        mobile_unit.mobile_desc = Insert_mobile_desc_txt.Text;
        mobile_unit.call_center_id = Convert.ToInt32(Insert_call_center_id_txt.Text);
        mobile_unit = mobile_unit.Insert(mobile_unit);
        Insert_mobile_unit_GridView.DataBind();
        Update_mobile_unit_GridView.DataBind();
        Delete_mobile_unit_GridView.DataBind();
        return mobile_unit;
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
        mobile_unit = Update_mobile_unit_select(Convert.ToInt32(Update_mobile_unit_GridView.SelectedValue));
    }
    public mobile_unit Update_mobile_unit_select(int ID)
    {
        mobile_unit = mobile_unit.Select(ID);
        Update_mobile_unit_id_txt.Text = Convert.ToString(mobile_unit.mobile_unit_id);
        Update_vehicle_id_txt.Text = Convert.ToString(mobile_unit.vehicle_id);
        Update_mobile_desc_txt.Text = Convert.ToString(mobile_unit.mobile_desc);
        Update_call_center_id_txt.Text = Convert.ToString(mobile_unit.call_center_id);
        return mobile_unit;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        mobile_unit = mobile_unit_update(Convert.ToInt32(Update_mobile_unit_GridView.SelectedValue));
    }
    public mobile_unit mobile_unit_update(int ID)
    {
        mobile_unit = mobile_unit.Select(ID);
        mobile_unit.mobile_unit_id = Convert.ToInt32(Update_mobile_unit_id_txt.Text);
        mobile_unit.vehicle_id = Convert.ToInt32(Update_vehicle_id_txt.Text);
        mobile_unit.mobile_desc = Update_mobile_desc_txt.Text;
        mobile_unit.call_center_id = Convert.ToInt32(Update_call_center_id_txt.Text);
        mobile_unit.Update(mobile_unit);
        Insert_mobile_unit_GridView.DataBind();
        Update_mobile_unit_GridView.DataBind();
        Delete_mobile_unit_GridView.DataBind();
        return mobile_unit;
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
        mobile_unit = Delete_mobile_unit_select(Convert.ToInt32(Delete_mobile_unit_GridView.SelectedValue));
    }
    public mobile_unit Delete_mobile_unit_select(int ID)
    {
        mobile_unit = mobile_unit.Select(ID);
        Delete_mobile_unit_id_txt_lbl.Text = Convert.ToString(mobile_unit.mobile_unit_id);
        Delete_vehicle_id_txt_lbl.Text = Convert.ToString(mobile_unit.vehicle_id);
        Delete_mobile_desc_txt_lbl.Text = Convert.ToString(mobile_unit.mobile_desc);
        Delete_call_center_id_txt_lbl.Text = Convert.ToString(mobile_unit.call_center_id);
        return mobile_unit;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        mobile_unit_delete(Convert.ToInt32(Delete_mobile_unit_GridView.SelectedValue));
    }
    public void mobile_unit_delete(int ID)
    {
        mobile_unit.Delete(ID);
        Insert_mobile_unit_GridView.DataBind();
        Update_mobile_unit_GridView.DataBind();
        Delete_mobile_unit_GridView.DataBind();
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

