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
public partial class Shipment_Screen : System.Web.UI.Page
{
            public Shipment Shipment = new Shipment();
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
        Shipment = Insert_Shipment_select(Convert.ToInt32(Insert_Shipment_GridView.SelectedValue));
    }
    public Shipment Insert_Shipment_select(int ID)
    {
        Shipment = Shipment.Select(ID);
        Insert_WarehouseID_txt.Text = Convert.ToString(Shipment.WarehouseID);
        Insert_Tracking_Num_txt.Text = Convert.ToString(Shipment.Tracking_Num);
        Insert_Ship_Method_txt.Text = Convert.ToString(Shipment.Ship_Method);
        Insert_Other_txt.Text = Convert.ToString(Shipment.Other);
        Insert_OrderRecByID_txt.Text = Convert.ToString(Shipment.OrderRecByID);
        Insert_FullOrderReceived_txt.Text = Convert.ToString(Shipment.FullOrderReceived);
        return Shipment;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Shipment = Shipment_insert();
    }
    public Shipment Shipment_insert()
    {
        Shipment.WarehouseID = Convert.ToInt32(Insert_WarehouseID_txt.Text);
        Shipment.Tracking_Num = Insert_Tracking_Num_txt.Text;
        Shipment.Ship_Method = Insert_Ship_Method_txt.Text;
        Shipment.Other = Insert_Other_txt.Text;
        Shipment.OrderRecByID = Convert.ToInt32(Insert_OrderRecByID_txt.Text);
        Shipment.FullOrderReceived = Insert_FullOrderReceived_txt.Text;
        Shipment = Shipment.Insert(Shipment);
        Insert_Shipment_GridView.DataBind();
        Update_Shipment_GridView.DataBind();
        Delete_Shipment_GridView.DataBind();
        return Shipment;
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
        Shipment = Update_Shipment_select(Convert.ToInt32(Update_Shipment_GridView.SelectedValue));
    }
    public Shipment Update_Shipment_select(int ID)
    {
        Shipment = Shipment.Select(ID);
        Update_ShipmentID_txt.Text = Convert.ToString(Shipment.ShipmentID);
        Update_WarehouseID_txt.Text = Convert.ToString(Shipment.WarehouseID);
        Update_Tracking_Num_txt.Text = Convert.ToString(Shipment.Tracking_Num);
        Update_Ship_Method_txt.Text = Convert.ToString(Shipment.Ship_Method);
        Update_Other_txt.Text = Convert.ToString(Shipment.Other);
        Update_OrderRecByID_txt.Text = Convert.ToString(Shipment.OrderRecByID);
        Update_FullOrderReceived_txt.Text = Convert.ToString(Shipment.FullOrderReceived);
        return Shipment;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Shipment = Shipment_update(Convert.ToInt32(Update_Shipment_GridView.SelectedValue));
    }
    public Shipment Shipment_update(int ID)
    {
        Shipment = Shipment.Select(ID);
        Shipment.ShipmentID = Convert.ToInt32(Update_ShipmentID_txt.Text);
        Shipment.WarehouseID = Convert.ToInt32(Update_WarehouseID_txt.Text);
        Shipment.Tracking_Num = Update_Tracking_Num_txt.Text;
        Shipment.Ship_Method = Update_Ship_Method_txt.Text;
        Shipment.Other = Update_Other_txt.Text;
        Shipment.OrderRecByID = Convert.ToInt32(Update_OrderRecByID_txt.Text);
        Shipment.FullOrderReceived = Update_FullOrderReceived_txt.Text;
        Shipment.Update(Shipment);
        Insert_Shipment_GridView.DataBind();
        Update_Shipment_GridView.DataBind();
        Delete_Shipment_GridView.DataBind();
        return Shipment;
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
        Shipment = Delete_Shipment_select(Convert.ToInt32(Delete_Shipment_GridView.SelectedValue));
    }
    public Shipment Delete_Shipment_select(int ID)
    {
        Shipment = Shipment.Select(ID);
        Delete_ShipmentID_txt_lbl.Text = Convert.ToString(Shipment.ShipmentID);
        Delete_WarehouseID_txt_lbl.Text = Convert.ToString(Shipment.WarehouseID);
        Delete_Tracking_Num_txt_lbl.Text = Convert.ToString(Shipment.Tracking_Num);
        Delete_Ship_Method_txt_lbl.Text = Convert.ToString(Shipment.Ship_Method);
        Delete_Other_txt_lbl.Text = Convert.ToString(Shipment.Other);
        Delete_OrderRecByID_txt_lbl.Text = Convert.ToString(Shipment.OrderRecByID);
        Delete_FullOrderReceived_txt_lbl.Text = Convert.ToString(Shipment.FullOrderReceived);
        return Shipment;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Shipment_delete(Convert.ToInt32(Delete_Shipment_GridView.SelectedValue));
    }
    public void Shipment_delete(int ID)
    {
        Shipment.Delete(ID);
        Insert_Shipment_GridView.DataBind();
        Update_Shipment_GridView.DataBind();
        Delete_Shipment_GridView.DataBind();
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

