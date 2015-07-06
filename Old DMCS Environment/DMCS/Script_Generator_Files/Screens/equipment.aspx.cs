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
public partial class equipment_ : System.Web.UI.Page
{
            public equipment equipment = new equipment();
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
        equipment = Insert_equipment_select(Convert.ToInt32(Insert_equipment_GridView.SelectedValue));
    }
    public equipment Insert_equipment_select(int ID)
    {
        equipment = equipment.Select(ID);
        Insert_resource_ID_txt.Text = Convert.ToString(equipment.resource_ID);
        Insert_vendor_id_txt.Text = Convert.ToString(equipment.vendor_id);
        Insert_Description_txt.Text = Convert.ToString(equipment.Description);
        Insert_costType_txt.Text = Convert.ToString(equipment.costType);
        Insert_costRate_txt.Text = Convert.ToString(equipment.costRate);
        Insert_capacity_txt.Text = Convert.ToString(equipment.capacity);
        Insert_make_txt.Text = Convert.ToString(equipment.make);
        Insert_model_txt.Text = Convert.ToString(equipment.model);
        Insert_operatorName_txt.Text = Convert.ToString(equipment.operatorName);
        Insert_startDate_txt.Text = Convert.ToString(equipment.startDate);
        Insert_endDate_txt.Text = Convert.ToString(equipment.endDate);
        return equipment;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        equipment = equipment_insert();
    }
    public equipment equipment_insert()
    {
        equipment.resource_ID = Convert.ToInt32(Insert_resource_ID_txt.Text);
        equipment.vendor_id = Convert.ToInt32(Insert_vendor_id_txt.Text);
        equipment.Description = Insert_Description_txt.Text;
        equipment.costType = Insert_costType_txt.Text;
        equipment.costRate = Convert.ToDecimal(Insert_costRate_txt.Text);
        equipment.capacity = Convert.ToInt32(Insert_capacity_txt.Text);
        equipment.make = Insert_make_txt.Text;
        equipment.model = Insert_model_txt.Text;
        equipment.operatorName = Insert_operatorName_txt.Text;
        equipment.startDate = Convert.ToDateTime(Insert_startDate_txt.Text);
        equipment.endDate = Convert.ToDateTime(Insert_endDate_txt.Text);
        equipment = equipment.Insert(equipment);
        Insert_equipment_GridView.DataBind();
        Update_equipment_GridView.DataBind();
        Delete_equipment_GridView.DataBind();
        return equipment;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        equipment = Update_equipment_select(Convert.ToInt32(Update_equipment_GridView.SelectedValue));
    }
    public equipment Update_equipment_select(int ID)
    {
        equipment = equipment.Select(ID);
        Update_equipment_id_txt.Text = Convert.ToString(equipment.equipment_id);
        Update_resource_ID_txt.Text = Convert.ToString(equipment.resource_ID);
        Update_vendor_id_txt.Text = Convert.ToString(equipment.vendor_id);
        Update_Description_txt.Text = Convert.ToString(equipment.Description);
        Update_costType_txt.Text = Convert.ToString(equipment.costType);
        Update_costRate_txt.Text = Convert.ToString(equipment.costRate);
        Update_capacity_txt.Text = Convert.ToString(equipment.capacity);
        Update_make_txt.Text = Convert.ToString(equipment.make);
        Update_model_txt.Text = Convert.ToString(equipment.model);
        Update_operatorName_txt.Text = Convert.ToString(equipment.operatorName);
        Update_startDate_txt.Text = Convert.ToString(equipment.startDate);
        Update_endDate_txt.Text = Convert.ToString(equipment.endDate);
        return equipment;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        equipment = equipment_update(Convert.ToInt32(Update_equipment_GridView.SelectedValue));
    }
    public equipment equipment_update(int ID)
    {
        equipment = equipment.Select(ID);
        equipment.equipment_id = Convert.ToInt32(Update_equipment_id_txt.Text);
        equipment.resource_ID = Convert.ToInt32(Update_resource_ID_txt.Text);
        equipment.vendor_id = Convert.ToInt32(Update_vendor_id_txt.Text);
        equipment.Description = Update_Description_txt.Text;
        equipment.costType = Update_costType_txt.Text;
        equipment.costRate = Convert.ToDecimal(Update_costRate_txt.Text);
        equipment.capacity = Convert.ToInt32(Update_capacity_txt.Text);
        equipment.make = Update_make_txt.Text;
        equipment.model = Update_model_txt.Text;
        equipment.operatorName = Update_operatorName_txt.Text;
        equipment.startDate = Convert.ToDateTime(Update_startDate_txt.Text);
        equipment.endDate = Convert.ToDateTime(Update_endDate_txt.Text);
        equipment.Update(equipment);
        Insert_equipment_GridView.DataBind();
        Update_equipment_GridView.DataBind();
        Delete_equipment_GridView.DataBind();
        return equipment;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        equipment = Delete_equipment_select(Convert.ToInt32(Delete_equipment_GridView.SelectedValue));
    }
    public equipment Delete_equipment_select(int ID)
    {
        equipment = equipment.Select(ID);
        Delete_equipment_id_txt_lbl.Text = Convert.ToString(equipment.equipment_id);
        Delete_resource_ID_txt_lbl.Text = Convert.ToString(equipment.resource_ID);
        Delete_vendor_id_txt_lbl.Text = Convert.ToString(equipment.vendor_id);
        Delete_Description_txt_lbl.Text = Convert.ToString(equipment.Description);
        Delete_costType_txt_lbl.Text = Convert.ToString(equipment.costType);
        Delete_costRate_txt_lbl.Text = Convert.ToString(equipment.costRate);
        Delete_capacity_txt_lbl.Text = Convert.ToString(equipment.capacity);
        Delete_make_txt_lbl.Text = Convert.ToString(equipment.make);
        Delete_model_txt_lbl.Text = Convert.ToString(equipment.model);
        Delete_operatorName_txt_lbl.Text = Convert.ToString(equipment.operatorName);
        Delete_startDate_txt_lbl.Text = Convert.ToString(equipment.startDate);
        Delete_endDate_txt_lbl.Text = Convert.ToString(equipment.endDate);
        return equipment;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        equipment_delete(Convert.ToInt32(Delete_equipment_GridView.SelectedValue));
    }
    public void equipment_delete(int ID)
    {
        equipment.Delete(ID);
        Insert_equipment_GridView.DataBind();
        Update_equipment_GridView.DataBind();
        Delete_equipment_GridView.DataBind();
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

