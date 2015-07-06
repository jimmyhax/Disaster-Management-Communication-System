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
public partial class warehouse_product_Location_Screen : System.Web.UI.Page
{
            public warehouse_product_Location warehouse_product_Location = new warehouse_product_Location();
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
        warehouse_product_Location = Insert_warehouse_product_Location_select(Convert.ToInt32(Insert_warehouse_product_Location_GridView.SelectedValue));
    }
    public warehouse_product_Location Insert_warehouse_product_Location_select(int ID)
    {
        warehouse_product_Location = warehouse_product_Location.Select(ID);
        Insert_warehouse_id_txt.Text = Convert.ToString(warehouse_product_Location.warehouse_id);
        Insert_product_id_txt.Text = Convert.ToString(warehouse_product_Location.product_id);
        Insert_Location_ID_txt.Text = Convert.ToString(warehouse_product_Location.Location_ID);
        Insert_service_id_txt.Text = Convert.ToString(warehouse_product_Location.service_id);
        Insert_Time_Date_MIA_txt.Text = Convert.ToString(warehouse_product_Location.Time_Date_MIA);
        Insert_Experiation_Date_txt.Text = Convert.ToString(warehouse_product_Location.Experiation_Date);
        Insert_min_inv_txt.Text = Convert.ToString(warehouse_product_Location.min_inv);
        Insert_status_txt.Text = Convert.ToString(warehouse_product_Location.status);
        Insert_Exp_delivery_date_txt.Text = Convert.ToString(warehouse_product_Location.Exp_delivery_date);
        Insert_qty_onhand_txt.Text = Convert.ToString(warehouse_product_Location.qty_onhand);
        Insert_qty_commit_txt.Text = Convert.ToString(warehouse_product_Location.qty_commit);
        Insert_qty_order_txt.Text = Convert.ToString(warehouse_product_Location.qty_order);
        Insert_encounter_id_txt.Text = Convert.ToString(warehouse_product_Location.encounter_id);
        Insert_address_id_txt.Text = Convert.ToString(warehouse_product_Location.address_id);
        return warehouse_product_Location;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        warehouse_product_Location = warehouse_product_Location_insert();
    }
    public warehouse_product_Location warehouse_product_Location_insert()
    {
        warehouse_product_Location.warehouse_id = Convert.ToInt32(Insert_warehouse_id_txt.Text);
        warehouse_product_Location.product_id = Convert.ToInt32(Insert_product_id_txt.Text);
        warehouse_product_Location.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        warehouse_product_Location.service_id = Convert.ToInt32(Insert_service_id_txt.Text);
        warehouse_product_Location.Time_Date_MIA = Convert.ToDateTime(Insert_Time_Date_MIA_txt.Text);
        warehouse_product_Location.Experiation_Date = Convert.ToDateTime(Insert_Experiation_Date_txt.Text);
        warehouse_product_Location.min_inv = Convert.ToInt32(Insert_min_inv_txt.Text);
        warehouse_product_Location.status = Insert_status_txt.Text;
        warehouse_product_Location.Exp_delivery_date = Convert.ToDateTime(Insert_Exp_delivery_date_txt.Text);
        warehouse_product_Location.qty_onhand = Convert.ToInt32(Insert_qty_onhand_txt.Text);
        warehouse_product_Location.qty_commit = Convert.ToInt32(Insert_qty_commit_txt.Text);
        warehouse_product_Location.qty_order = Convert.ToInt32(Insert_qty_order_txt.Text);
        warehouse_product_Location.encounter_id = Convert.ToInt32(Insert_encounter_id_txt.Text);
        warehouse_product_Location.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        warehouse_product_Location = warehouse_product_Location.Insert(warehouse_product_Location);
        Insert_warehouse_product_Location_GridView.DataBind();
        Update_warehouse_product_Location_GridView.DataBind();
        Delete_warehouse_product_Location_GridView.DataBind();
        return warehouse_product_Location;
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
        warehouse_product_Location = Update_warehouse_product_Location_select(Convert.ToInt32(Update_warehouse_product_Location_GridView.SelectedValue));
    }
    public warehouse_product_Location Update_warehouse_product_Location_select(int ID)
    {
        warehouse_product_Location = warehouse_product_Location.Select(ID);
        Update_warehouse_product_location_id_txt.Text = Convert.ToString(warehouse_product_Location.warehouse_product_location_id);
        Update_warehouse_id_txt.Text = Convert.ToString(warehouse_product_Location.warehouse_id);
        Update_product_id_txt.Text = Convert.ToString(warehouse_product_Location.product_id);
        Update_Location_ID_txt.Text = Convert.ToString(warehouse_product_Location.Location_ID);
        Update_service_id_txt.Text = Convert.ToString(warehouse_product_Location.service_id);
        Update_Time_Date_MIA_txt.Text = Convert.ToString(warehouse_product_Location.Time_Date_MIA);
        Update_Experiation_Date_txt.Text = Convert.ToString(warehouse_product_Location.Experiation_Date);
        Update_min_inv_txt.Text = Convert.ToString(warehouse_product_Location.min_inv);
        Update_status_txt.Text = Convert.ToString(warehouse_product_Location.status);
        Update_Exp_delivery_date_txt.Text = Convert.ToString(warehouse_product_Location.Exp_delivery_date);
        Update_qty_onhand_txt.Text = Convert.ToString(warehouse_product_Location.qty_onhand);
        Update_qty_commit_txt.Text = Convert.ToString(warehouse_product_Location.qty_commit);
        Update_qty_order_txt.Text = Convert.ToString(warehouse_product_Location.qty_order);
        Update_encounter_id_txt.Text = Convert.ToString(warehouse_product_Location.encounter_id);
        Update_address_id_txt.Text = Convert.ToString(warehouse_product_Location.address_id);
        return warehouse_product_Location;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        warehouse_product_Location = warehouse_product_Location_update(Convert.ToInt32(Update_warehouse_product_Location_GridView.SelectedValue));
    }
    public warehouse_product_Location warehouse_product_Location_update(int ID)
    {
        warehouse_product_Location = warehouse_product_Location.Select(ID);
        warehouse_product_Location.warehouse_product_location_id = Convert.ToInt32(Update_warehouse_product_location_id_txt.Text);
        warehouse_product_Location.warehouse_id = Convert.ToInt32(Update_warehouse_id_txt.Text);
        warehouse_product_Location.product_id = Convert.ToInt32(Update_product_id_txt.Text);
        warehouse_product_Location.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        warehouse_product_Location.service_id = Convert.ToInt32(Update_service_id_txt.Text);
        warehouse_product_Location.Time_Date_MIA = Convert.ToDateTime(Update_Time_Date_MIA_txt.Text);
        warehouse_product_Location.Experiation_Date = Convert.ToDateTime(Update_Experiation_Date_txt.Text);
        warehouse_product_Location.min_inv = Convert.ToInt32(Update_min_inv_txt.Text);
        warehouse_product_Location.status = Update_status_txt.Text;
        warehouse_product_Location.Exp_delivery_date = Convert.ToDateTime(Update_Exp_delivery_date_txt.Text);
        warehouse_product_Location.qty_onhand = Convert.ToInt32(Update_qty_onhand_txt.Text);
        warehouse_product_Location.qty_commit = Convert.ToInt32(Update_qty_commit_txt.Text);
        warehouse_product_Location.qty_order = Convert.ToInt32(Update_qty_order_txt.Text);
        warehouse_product_Location.encounter_id = Convert.ToInt32(Update_encounter_id_txt.Text);
        warehouse_product_Location.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        warehouse_product_Location.Update(warehouse_product_Location);
        Insert_warehouse_product_Location_GridView.DataBind();
        Update_warehouse_product_Location_GridView.DataBind();
        Delete_warehouse_product_Location_GridView.DataBind();
        return warehouse_product_Location;
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
        warehouse_product_Location = Delete_warehouse_product_Location_select(Convert.ToInt32(Delete_warehouse_product_Location_GridView.SelectedValue));
    }
    public warehouse_product_Location Delete_warehouse_product_Location_select(int ID)
    {
        warehouse_product_Location = warehouse_product_Location.Select(ID);
        Delete_warehouse_product_location_id_txt_lbl.Text = Convert.ToString(warehouse_product_Location.warehouse_product_location_id);
        Delete_warehouse_id_txt_lbl.Text = Convert.ToString(warehouse_product_Location.warehouse_id);
        Delete_product_id_txt_lbl.Text = Convert.ToString(warehouse_product_Location.product_id);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(warehouse_product_Location.Location_ID);
        Delete_service_id_txt_lbl.Text = Convert.ToString(warehouse_product_Location.service_id);
        Delete_Time_Date_MIA_txt_lbl.Text = Convert.ToString(warehouse_product_Location.Time_Date_MIA);
        Delete_Experiation_Date_txt_lbl.Text = Convert.ToString(warehouse_product_Location.Experiation_Date);
        Delete_min_inv_txt_lbl.Text = Convert.ToString(warehouse_product_Location.min_inv);
        Delete_status_txt_lbl.Text = Convert.ToString(warehouse_product_Location.status);
        Delete_Exp_delivery_date_txt_lbl.Text = Convert.ToString(warehouse_product_Location.Exp_delivery_date);
        Delete_qty_onhand_txt_lbl.Text = Convert.ToString(warehouse_product_Location.qty_onhand);
        Delete_qty_commit_txt_lbl.Text = Convert.ToString(warehouse_product_Location.qty_commit);
        Delete_qty_order_txt_lbl.Text = Convert.ToString(warehouse_product_Location.qty_order);
        Delete_encounter_id_txt_lbl.Text = Convert.ToString(warehouse_product_Location.encounter_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(warehouse_product_Location.address_id);
        return warehouse_product_Location;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        warehouse_product_Location_delete(Convert.ToInt32(Delete_warehouse_product_Location_GridView.SelectedValue));
    }
    public void warehouse_product_Location_delete(int ID)
    {
        warehouse_product_Location.Delete(ID);
        Insert_warehouse_product_Location_GridView.DataBind();
        Update_warehouse_product_Location_GridView.DataBind();
        Delete_warehouse_product_Location_GridView.DataBind();
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

