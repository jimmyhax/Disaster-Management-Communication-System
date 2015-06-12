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
public partial class products_Screen : System.Web.UI.Page
{
            public products products = new products();
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
        products = Insert_products_select(Convert.ToInt32(Insert_products_GridView.SelectedValue));
    }
    public products Insert_products_select(int ID)
    {
        products = products.Select(ID);
        Insert_Resource_ID_txt.Text = Convert.ToString(products.Resource_ID);
        Insert_product_name_txt.Text = Convert.ToString(products.product_name);
        Insert_product_type_txt.Text = Convert.ToString(products.product_type);
        Insert_product_qty_txt.Text = Convert.ToString(products.product_qty);
        Insert_product_desc_txt.Text = Convert.ToString(products.product_desc);
        Insert_product_color_txt.Text = Convert.ToString(products.product_color);
        Insert_product_size_txt.Text = Convert.ToString(products.product_size);
        Insert_product_cost_txt.Text = Convert.ToString(products.product_cost);
        Insert_Product_exp_date_txt.Text = Convert.ToString(products.Product_exp_date);
        Insert_Product_Alergy_info_txt.Text = Convert.ToString(products.Product_Alergy_info);
        Insert_Product_refrigde_txt.Text = Convert.ToString(products.Product_refrigde);
        Insert_Product_Flammable_txt.Text = Convert.ToString(products.Product_Flammable);
        Insert_Product_Hazard_txt.Text = Convert.ToString(products.Product_Hazard);
        Insert_Product_Other_txt.Text = Convert.ToString(products.Product_Other);
        Insert_Product_Min_Inv_txt.Text = Convert.ToString(products.Product_Min_Inv);
        Insert_Product_Barcode_txt.Text = Convert.ToString(products.Product_Barcode);
        Insert_Product_subtype_txt.Text = Convert.ToString(products.Product_subtype);
        Insert_Make_txt.Text = Convert.ToString(products.Make);
        Insert_Model_txt.Text = Convert.ToString(products.Model);
        Insert_FEMA_Description_txt.Text = Convert.ToString(products.FEMA_Description);
        Insert_Year_txt.Text = Convert.ToString(products.Year);
        Insert_RFID_txt.Text = Convert.ToString(products.RFID);
        Insert_GPS_txt.Text = Convert.ToString(products.GPS);
        Insert_Serial_Number_txt.Text = Convert.ToString(products.Serial_Number);
        Insert_Height_txt.Text = Convert.ToString(products.Height);
        Insert_Length_txt.Text = Convert.ToString(products.Length);
        Insert_Depth_txt.Text = Convert.ToString(products.Depth);
        Insert_Weight_txt.Text = Convert.ToString(products.Weight);
        Insert_OAI_txt.Text = Convert.ToString(products.OAI);
        Insert_OAI_Type_txt.Text = Convert.ToString(products.OAI_Type);
        Insert_Use_txt.Text = Convert.ToString(products.Use);
        Insert_Brand_txt.Text = Convert.ToString(products.Brand);
        Insert_Power_Supply_txt.Text = Convert.ToString(products.Power_Supply);
        Insert_Gas_Type_txt.Text = Convert.ToString(products.Gas_Type);
        Insert_Needs_Gas_txt.Text = Convert.ToString(products.Needs_Gas);
        Insert_Needs_Electricity_txt.Text = Convert.ToString(products.Needs_Electricity);
        Insert_Availability_txt.Text = Convert.ToString(products.Availability);
        Insert_Datetime_txt.Text = Convert.ToString(products.Datetime);
        Insert_OpenStatus_txt.Text = Convert.ToString(products.OpenStatus);
        return products;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        products = products_insert();
    }
    public products products_insert()
    {
        products.Resource_ID = Convert.ToInt32(Insert_Resource_ID_txt.Text);
        products.product_name = Insert_product_name_txt.Text;
        products.product_type = Insert_product_type_txt.Text;
        products.product_qty = Convert.ToInt32(Insert_product_qty_txt.Text);
        products.product_desc = Insert_product_desc_txt.Text;
        products.product_color = Insert_product_color_txt.Text;
        products.product_size = Insert_product_size_txt.Text;
        products.product_cost = Convert.ToDecimal(Insert_product_cost_txt.Text);
        products.Product_exp_date = Convert.ToDateTime(Insert_Product_exp_date_txt.Text);
        products.Product_Alergy_info = Insert_Product_Alergy_info_txt.Text;
        products.Product_refrigde = Insert_Product_refrigde_txt.Text;
        products.Product_Flammable = Insert_Product_Flammable_txt.Text;
        products.Product_Hazard = Insert_Product_Hazard_txt.Text;
        products.Product_Other = Insert_Product_Other_txt.Text;
        products.Product_Min_Inv = Convert.ToInt32(Insert_Product_Min_Inv_txt.Text);
        products.Product_Barcode = Insert_Product_Barcode_txt.Text;
        products.Product_subtype = Insert_Product_subtype_txt.Text;
        products.Make = Insert_Make_txt.Text;
        products.Model = Insert_Model_txt.Text;
        products.FEMA_Description = Insert_FEMA_Description_txt.Text;
        products.Year = Insert_Year_txt.Text;
        products.RFID = Insert_RFID_txt.Text;
        products.Serial_Number = Insert_Serial_Number_txt.Text;
        products.Height = Insert_Height_txt.Text;
        products.Length = Insert_Length_txt.Text;
        products.Depth = Insert_Depth_txt.Text;
        products.Weight = Insert_Weight_txt.Text;
        products.OAI = Insert_OAI_txt.Text;
        products.OAI_Type = Insert_OAI_Type_txt.Text;
        products.Use = Insert_Use_txt.Text;
        products.Brand = Insert_Brand_txt.Text;
        products.Power_Supply = Insert_Power_Supply_txt.Text;
        products.Gas_Type = Insert_Gas_Type_txt.Text;
        products.Needs_Gas = Convert.ToBoolean(Insert_Needs_Gas_txt.Text);
        products.Needs_Electricity = Convert.ToBoolean(Insert_Needs_Electricity_txt.Text);
        products.Availability = Insert_Availability_txt.Text;
        products.Datetime = Convert.ToDateTime(Insert_Datetime_txt.Text);
        products.OpenStatus = Insert_OpenStatus_txt.Text;
        products = products.Insert(products);
        Insert_products_GridView.DataBind();
        Update_products_GridView.DataBind();
        Delete_products_GridView.DataBind();
        return products;
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
        products = Update_products_select(Convert.ToInt32(Update_products_GridView.SelectedValue));
    }
    public products Update_products_select(int ID)
    {
        products = products.Select(ID);
        Update_product_id_txt.Text = Convert.ToString(products.product_id);
        Update_Resource_ID_txt.Text = Convert.ToString(products.Resource_ID);
        Update_product_name_txt.Text = Convert.ToString(products.product_name);
        Update_product_type_txt.Text = Convert.ToString(products.product_type);
        Update_product_qty_txt.Text = Convert.ToString(products.product_qty);
        Update_product_desc_txt.Text = Convert.ToString(products.product_desc);
        Update_product_color_txt.Text = Convert.ToString(products.product_color);
        Update_product_size_txt.Text = Convert.ToString(products.product_size);
        Update_product_cost_txt.Text = Convert.ToString(products.product_cost);
        Update_Product_exp_date_txt.Text = Convert.ToString(products.Product_exp_date);
        Update_Product_Alergy_info_txt.Text = Convert.ToString(products.Product_Alergy_info);
        Update_Product_refrigde_txt.Text = Convert.ToString(products.Product_refrigde);
        Update_Product_Flammable_txt.Text = Convert.ToString(products.Product_Flammable);
        Update_Product_Hazard_txt.Text = Convert.ToString(products.Product_Hazard);
        Update_Product_Other_txt.Text = Convert.ToString(products.Product_Other);
        Update_Product_Min_Inv_txt.Text = Convert.ToString(products.Product_Min_Inv);
        Update_Product_Barcode_txt.Text = Convert.ToString(products.Product_Barcode);
        Update_Product_subtype_txt.Text = Convert.ToString(products.Product_subtype);
        Update_Make_txt.Text = Convert.ToString(products.Make);
        Update_Model_txt.Text = Convert.ToString(products.Model);
        Update_FEMA_Description_txt.Text = Convert.ToString(products.FEMA_Description);
        Update_Year_txt.Text = Convert.ToString(products.Year);
        Update_RFID_txt.Text = Convert.ToString(products.RFID);
        Update_GPS_txt.Text = Convert.ToString(products.GPS);
        Update_Serial_Number_txt.Text = Convert.ToString(products.Serial_Number);
        Update_Height_txt.Text = Convert.ToString(products.Height);
        Update_Length_txt.Text = Convert.ToString(products.Length);
        Update_Depth_txt.Text = Convert.ToString(products.Depth);
        Update_Weight_txt.Text = Convert.ToString(products.Weight);
        Update_OAI_txt.Text = Convert.ToString(products.OAI);
        Update_OAI_Type_txt.Text = Convert.ToString(products.OAI_Type);
        Update_Use_txt.Text = Convert.ToString(products.Use);
        Update_Brand_txt.Text = Convert.ToString(products.Brand);
        Update_Power_Supply_txt.Text = Convert.ToString(products.Power_Supply);
        Update_Gas_Type_txt.Text = Convert.ToString(products.Gas_Type);
        Update_Needs_Gas_txt.Text = Convert.ToString(products.Needs_Gas);
        Update_Needs_Electricity_txt.Text = Convert.ToString(products.Needs_Electricity);
        Update_Availability_txt.Text = Convert.ToString(products.Availability);
        Update_Datetime_txt.Text = Convert.ToString(products.Datetime);
        Update_OpenStatus_txt.Text = Convert.ToString(products.OpenStatus);
        return products;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        products = products_update(Convert.ToInt32(Update_products_GridView.SelectedValue));
    }
    public products products_update(int ID)
    {
        products = products.Select(ID);
        products.product_id = Convert.ToInt32(Update_product_id_txt.Text);
        products.Resource_ID = Convert.ToInt32(Update_Resource_ID_txt.Text);
        products.product_name = Update_product_name_txt.Text;
        products.product_type = Update_product_type_txt.Text;
        products.product_qty = Convert.ToInt32(Update_product_qty_txt.Text);
        products.product_desc = Update_product_desc_txt.Text;
        products.product_color = Update_product_color_txt.Text;
        products.product_size = Update_product_size_txt.Text;
        products.product_cost = Convert.ToDecimal(Update_product_cost_txt.Text);
        products.Product_exp_date = Convert.ToDateTime(Update_Product_exp_date_txt.Text);
        products.Product_Alergy_info = Update_Product_Alergy_info_txt.Text;
        products.Product_refrigde = Update_Product_refrigde_txt.Text;
        products.Product_Flammable = Update_Product_Flammable_txt.Text;
        products.Product_Hazard = Update_Product_Hazard_txt.Text;
        products.Product_Other = Update_Product_Other_txt.Text;
        products.Product_Min_Inv = Convert.ToInt32(Update_Product_Min_Inv_txt.Text);
        products.Product_Barcode = Update_Product_Barcode_txt.Text;
        products.Product_subtype = Update_Product_subtype_txt.Text;
        products.Make = Update_Make_txt.Text;
        products.Model = Update_Model_txt.Text;
        products.FEMA_Description = Update_FEMA_Description_txt.Text;
        products.Year = Update_Year_txt.Text;
        products.RFID = Update_RFID_txt.Text;
        products.Serial_Number = Update_Serial_Number_txt.Text;
        products.Height = Update_Height_txt.Text;
        products.Length = Update_Length_txt.Text;
        products.Depth = Update_Depth_txt.Text;
        products.Weight = Update_Weight_txt.Text;
        products.OAI = Update_OAI_txt.Text;
        products.OAI_Type = Update_OAI_Type_txt.Text;
        products.Use = Update_Use_txt.Text;
        products.Brand = Update_Brand_txt.Text;
        products.Power_Supply = Update_Power_Supply_txt.Text;
        products.Gas_Type = Update_Gas_Type_txt.Text;
        products.Needs_Gas = Convert.ToBoolean(Update_Needs_Gas_txt.Text);
        products.Needs_Electricity = Convert.ToBoolean(Update_Needs_Electricity_txt.Text);
        products.Availability = Update_Availability_txt.Text;
        products.Datetime = Convert.ToDateTime(Update_Datetime_txt.Text);
        products.OpenStatus = Update_OpenStatus_txt.Text;
        products.Update(products);
        Insert_products_GridView.DataBind();
        Update_products_GridView.DataBind();
        Delete_products_GridView.DataBind();
        return products;
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
        products = Delete_products_select(Convert.ToInt32(Delete_products_GridView.SelectedValue));
    }
    public products Delete_products_select(int ID)
    {
        products = products.Select(ID);
        Delete_product_id_txt_lbl.Text = Convert.ToString(products.product_id);
        Delete_Resource_ID_txt_lbl.Text = Convert.ToString(products.Resource_ID);
        Delete_product_name_txt_lbl.Text = Convert.ToString(products.product_name);
        Delete_product_type_txt_lbl.Text = Convert.ToString(products.product_type);
        Delete_product_qty_txt_lbl.Text = Convert.ToString(products.product_qty);
        Delete_product_desc_txt_lbl.Text = Convert.ToString(products.product_desc);
        Delete_product_color_txt_lbl.Text = Convert.ToString(products.product_color);
        Delete_product_size_txt_lbl.Text = Convert.ToString(products.product_size);
        Delete_product_cost_txt_lbl.Text = Convert.ToString(products.product_cost);
        Delete_Product_exp_date_txt_lbl.Text = Convert.ToString(products.Product_exp_date);
        Delete_Product_Alergy_info_txt_lbl.Text = Convert.ToString(products.Product_Alergy_info);
        Delete_Product_refrigde_txt_lbl.Text = Convert.ToString(products.Product_refrigde);
        Delete_Product_Flammable_txt_lbl.Text = Convert.ToString(products.Product_Flammable);
        Delete_Product_Hazard_txt_lbl.Text = Convert.ToString(products.Product_Hazard);
        Delete_Product_Other_txt_lbl.Text = Convert.ToString(products.Product_Other);
        Delete_Product_Min_Inv_txt_lbl.Text = Convert.ToString(products.Product_Min_Inv);
        Delete_Product_Barcode_txt_lbl.Text = Convert.ToString(products.Product_Barcode);
        Delete_Product_subtype_txt_lbl.Text = Convert.ToString(products.Product_subtype);
        Delete_Make_txt_lbl.Text = Convert.ToString(products.Make);
        Delete_Model_txt_lbl.Text = Convert.ToString(products.Model);
        Delete_FEMA_Description_txt_lbl.Text = Convert.ToString(products.FEMA_Description);
        Delete_Year_txt_lbl.Text = Convert.ToString(products.Year);
        Delete_RFID_txt_lbl.Text = Convert.ToString(products.RFID);
        Delete_GPS_txt_lbl.Text = Convert.ToString(products.GPS);
        Delete_Serial_Number_txt_lbl.Text = Convert.ToString(products.Serial_Number);
        Delete_Height_txt_lbl.Text = Convert.ToString(products.Height);
        Delete_Length_txt_lbl.Text = Convert.ToString(products.Length);
        Delete_Depth_txt_lbl.Text = Convert.ToString(products.Depth);
        Delete_Weight_txt_lbl.Text = Convert.ToString(products.Weight);
        Delete_OAI_txt_lbl.Text = Convert.ToString(products.OAI);
        Delete_OAI_Type_txt_lbl.Text = Convert.ToString(products.OAI_Type);
        Delete_Use_txt_lbl.Text = Convert.ToString(products.Use);
        Delete_Brand_txt_lbl.Text = Convert.ToString(products.Brand);
        Delete_Power_Supply_txt_lbl.Text = Convert.ToString(products.Power_Supply);
        Delete_Gas_Type_txt_lbl.Text = Convert.ToString(products.Gas_Type);
        Delete_Needs_Gas_txt_lbl.Text = Convert.ToString(products.Needs_Gas);
        Delete_Needs_Electricity_txt_lbl.Text = Convert.ToString(products.Needs_Electricity);
        Delete_Availability_txt_lbl.Text = Convert.ToString(products.Availability);
        Delete_Datetime_txt_lbl.Text = Convert.ToString(products.Datetime);
        Delete_OpenStatus_txt_lbl.Text = Convert.ToString(products.OpenStatus);
        return products;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        products_delete(Convert.ToInt32(Delete_products_GridView.SelectedValue));
    }
    public void products_delete(int ID)
    {
        products.Delete(ID);
        Insert_products_GridView.DataBind();
        Update_products_GridView.DataBind();
        Delete_products_GridView.DataBind();
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

