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
public partial class warehouse_Screen : System.Web.UI.Page
{
            public warehouse warehouse = new warehouse();
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
        warehouse = Insert_warehouse_select(Convert.ToInt32(Insert_warehouse_GridView.SelectedValue));
    }
    public warehouse Insert_warehouse_select(int ID)
    {
        warehouse = warehouse.Select(ID);
        Insert_warehouse_name_txt.Text = Convert.ToString(warehouse.warehouse_name);
        Insert_address_id_txt.Text = Convert.ToString(warehouse.address_id);
        Insert_warehouse_type_txt.Text = Convert.ToString(warehouse.warehouse_type);
        Insert_Location_ID_txt.Text = Convert.ToString(warehouse.Location_ID);
        return warehouse;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        warehouse = warehouse_insert();
    }
    public warehouse warehouse_insert()
    {
        warehouse.warehouse_name = Insert_warehouse_name_txt.Text;
        warehouse.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        warehouse.warehouse_type = Insert_warehouse_type_txt.Text;
        warehouse.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        warehouse = warehouse.Insert(warehouse);
        Insert_warehouse_GridView.DataBind();
        Update_warehouse_GridView.DataBind();
        Delete_warehouse_GridView.DataBind();
        return warehouse;
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
        warehouse = Update_warehouse_select(Convert.ToInt32(Update_warehouse_GridView.SelectedValue));
    }
    public warehouse Update_warehouse_select(int ID)
    {
        warehouse = warehouse.Select(ID);
        Update_warehouse_id_txt.Text = Convert.ToString(warehouse.warehouse_id);
        Update_warehouse_name_txt.Text = Convert.ToString(warehouse.warehouse_name);
        Update_address_id_txt.Text = Convert.ToString(warehouse.address_id);
        Update_warehouse_type_txt.Text = Convert.ToString(warehouse.warehouse_type);
        Update_Location_ID_txt.Text = Convert.ToString(warehouse.Location_ID);
        return warehouse;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        warehouse = warehouse_update(Convert.ToInt32(Update_warehouse_GridView.SelectedValue));
    }
    public warehouse warehouse_update(int ID)
    {
        warehouse = warehouse.Select(ID);
        warehouse.warehouse_id = Convert.ToInt32(Update_warehouse_id_txt.Text);
        warehouse.warehouse_name = Update_warehouse_name_txt.Text;
        warehouse.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        warehouse.warehouse_type = Update_warehouse_type_txt.Text;
        warehouse.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        warehouse.Update(warehouse);
        Insert_warehouse_GridView.DataBind();
        Update_warehouse_GridView.DataBind();
        Delete_warehouse_GridView.DataBind();
        return warehouse;
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
        warehouse = Delete_warehouse_select(Convert.ToInt32(Delete_warehouse_GridView.SelectedValue));
    }
    public warehouse Delete_warehouse_select(int ID)
    {
        warehouse = warehouse.Select(ID);
        Delete_warehouse_id_txt_lbl.Text = Convert.ToString(warehouse.warehouse_id);
        Delete_warehouse_name_txt_lbl.Text = Convert.ToString(warehouse.warehouse_name);
        Delete_address_id_txt_lbl.Text = Convert.ToString(warehouse.address_id);
        Delete_warehouse_type_txt_lbl.Text = Convert.ToString(warehouse.warehouse_type);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(warehouse.Location_ID);
        return warehouse;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        warehouse_delete(Convert.ToInt32(Delete_warehouse_GridView.SelectedValue));
    }
    public void warehouse_delete(int ID)
    {
        warehouse.Delete(ID);
        Insert_warehouse_GridView.DataBind();
        Update_warehouse_GridView.DataBind();
        Delete_warehouse_GridView.DataBind();
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

