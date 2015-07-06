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
public partial class requestor_Order_Screen : System.Web.UI.Page
{
            public requestor_Order requestor_Order = new requestor_Order();
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
        requestor_Order = Insert_requestor_Order_select(Convert.ToInt32(Insert_requestor_Order_GridView.SelectedValue));
    }
    public requestor_Order Insert_requestor_Order_select(int ID)
    {
        requestor_Order = requestor_Order.Select(ID);
        Insert_Requestor_ID_txt.Text = Convert.ToString(requestor_Order.Requestor_ID);
        Insert_EncounterID_txt.Text = Convert.ToString(requestor_Order.EncounterID);
        Insert_OrderPriority_txt.Text = Convert.ToString(requestor_Order.OrderPriority);
        Insert_OrderNum_txt.Text = Convert.ToString(requestor_Order.OrderNum);
        Insert_ShipToAddressID_txt.Text = Convert.ToString(requestor_Order.ShipToAddressID);
        Insert_OrderDeliveryType_txt.Text = Convert.ToString(requestor_Order.OrderDeliveryType);
        Insert_OrderPickUpDate_txt.Text = Convert.ToString(requestor_Order.OrderPickUpDate);
        return requestor_Order;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        requestor_Order = requestor_Order_insert();
    }
    public requestor_Order requestor_Order_insert()
    {
        requestor_Order.Requestor_ID = Convert.ToInt32(Insert_Requestor_ID_txt.Text);
        requestor_Order.EncounterID = Convert.ToInt32(Insert_EncounterID_txt.Text);
        requestor_Order.OrderPriority = Convert.ToInt32(Insert_OrderPriority_txt.Text);
        requestor_Order.OrderNum = Convert.ToInt32(Insert_OrderNum_txt.Text);
        requestor_Order.ShipToAddressID = Convert.ToInt32(Insert_ShipToAddressID_txt.Text);
        requestor_Order.OrderDeliveryType = Insert_OrderDeliveryType_txt.Text;
        requestor_Order.OrderPickUpDate = Convert.ToDateTime(Insert_OrderPickUpDate_txt.Text);
        requestor_Order = requestor_Order.Insert(requestor_Order);
        Insert_requestor_Order_GridView.DataBind();
        Update_requestor_Order_GridView.DataBind();
        Delete_requestor_Order_GridView.DataBind();
        return requestor_Order;
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
        requestor_Order = Update_requestor_Order_select(Convert.ToInt32(Update_requestor_Order_GridView.SelectedValue));
    }
    public requestor_Order Update_requestor_Order_select(int ID)
    {
        requestor_Order = requestor_Order.Select(ID);
        Update_OrderID_txt.Text = Convert.ToString(requestor_Order.OrderID);
        Update_Requestor_ID_txt.Text = Convert.ToString(requestor_Order.Requestor_ID);
        Update_EncounterID_txt.Text = Convert.ToString(requestor_Order.EncounterID);
        Update_OrderPriority_txt.Text = Convert.ToString(requestor_Order.OrderPriority);
        Update_OrderNum_txt.Text = Convert.ToString(requestor_Order.OrderNum);
        Update_ShipToAddressID_txt.Text = Convert.ToString(requestor_Order.ShipToAddressID);
        Update_OrderDeliveryType_txt.Text = Convert.ToString(requestor_Order.OrderDeliveryType);
        Update_OrderPickUpDate_txt.Text = Convert.ToString(requestor_Order.OrderPickUpDate);
        return requestor_Order;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        requestor_Order = requestor_Order_update(Convert.ToInt32(Update_requestor_Order_GridView.SelectedValue));
    }
    public requestor_Order requestor_Order_update(int ID)
    {
        requestor_Order = requestor_Order.Select(ID);
        requestor_Order.OrderID = Convert.ToInt32(Update_OrderID_txt.Text);
        requestor_Order.Requestor_ID = Convert.ToInt32(Update_Requestor_ID_txt.Text);
        requestor_Order.EncounterID = Convert.ToInt32(Update_EncounterID_txt.Text);
        requestor_Order.OrderPriority = Convert.ToInt32(Update_OrderPriority_txt.Text);
        requestor_Order.OrderNum = Convert.ToInt32(Update_OrderNum_txt.Text);
        requestor_Order.ShipToAddressID = Convert.ToInt32(Update_ShipToAddressID_txt.Text);
        requestor_Order.OrderDeliveryType = Update_OrderDeliveryType_txt.Text;
        requestor_Order.OrderPickUpDate = Convert.ToDateTime(Update_OrderPickUpDate_txt.Text);
        requestor_Order.Update(requestor_Order);
        Insert_requestor_Order_GridView.DataBind();
        Update_requestor_Order_GridView.DataBind();
        Delete_requestor_Order_GridView.DataBind();
        return requestor_Order;
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
        requestor_Order = Delete_requestor_Order_select(Convert.ToInt32(Delete_requestor_Order_GridView.SelectedValue));
    }
    public requestor_Order Delete_requestor_Order_select(int ID)
    {
        requestor_Order = requestor_Order.Select(ID);
        Delete_OrderID_txt_lbl.Text = Convert.ToString(requestor_Order.OrderID);
        Delete_Requestor_ID_txt_lbl.Text = Convert.ToString(requestor_Order.Requestor_ID);
        Delete_EncounterID_txt_lbl.Text = Convert.ToString(requestor_Order.EncounterID);
        Delete_OrderPriority_txt_lbl.Text = Convert.ToString(requestor_Order.OrderPriority);
        Delete_OrderNum_txt_lbl.Text = Convert.ToString(requestor_Order.OrderNum);
        Delete_ShipToAddressID_txt_lbl.Text = Convert.ToString(requestor_Order.ShipToAddressID);
        Delete_OrderDeliveryType_txt_lbl.Text = Convert.ToString(requestor_Order.OrderDeliveryType);
        Delete_OrderPickUpDate_txt_lbl.Text = Convert.ToString(requestor_Order.OrderPickUpDate);
        return requestor_Order;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        requestor_Order_delete(Convert.ToInt32(Delete_requestor_Order_GridView.SelectedValue));
    }
    public void requestor_Order_delete(int ID)
    {
        requestor_Order.Delete(ID);
        Insert_requestor_Order_GridView.DataBind();
        Update_requestor_Order_GridView.DataBind();
        Delete_requestor_Order_GridView.DataBind();
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

