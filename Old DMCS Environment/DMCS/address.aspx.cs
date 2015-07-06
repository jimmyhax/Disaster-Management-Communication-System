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
public partial class address_ : System.Web.UI.Page
{
            public address address = new address();
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
        address = Insert_address_select(Convert.ToInt32(Insert_address_GridView.SelectedValue));
    }
    public address Insert_address_select(int ID)
    {
        address = address.Select(ID);
        Insert_address_type_id_txt.Text = Convert.ToString(address.address_type_id);
        Insert_city_txt.Text = Convert.ToString(address.city);
        Insert_country_txt.Text = Convert.ToString(address.country);
        Insert_County_Township_txt.Text = Convert.ToString(address.County_Township);
        Insert_longitude_txt.Text = Convert.ToString(address.longitude);
        Insert_latitude_txt.Text = Convert.ToString(address.latitude);
        Insert_state_txt.Text = Convert.ToString(address.state);
        Insert_str_add_txt.Text = Convert.ToString(address.str_add);
        Insert_str_add2_txt.Text = Convert.ToString(address.str_add2);
        Insert_zip_plus_four_txt.Text = Convert.ToString(address.zip_plus_four);
        return address;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        address = address_insert();
    }
    public address address_insert()
    {
        address.address_type_id = Convert.ToInt32(Insert_address_type_id_txt.Text);
        address.city = Insert_city_txt.Text;
        address.country = Insert_country_txt.Text;
        address.County_Township = Insert_County_Township_txt.Text;
        address.longitude = Convert.ToDecimal(Insert_longitude_txt.Text);
        address.latitude = Convert.ToDecimal(Insert_latitude_txt.Text);
        address.state = Insert_state_txt.Text;
        address.str_add = Insert_str_add_txt.Text;
        address.str_add2 = Insert_str_add2_txt.Text;
        address.zip_plus_four = Insert_zip_plus_four_txt.Text;
        address = address.Insert(address);
        Insert_address_GridView.DataBind();
        Update_address_GridView.DataBind();
        Delete_address_GridView.DataBind();
        return address;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        address = Update_address_select(Convert.ToInt32(Update_address_GridView.SelectedValue));
    }
    public address Update_address_select(int ID)
    {
        address = address.Select(ID);
        Update_address_id_txt.Text = Convert.ToString(address.address_id);
        Update_address_type_id_txt.Text = Convert.ToString(address.address_type_id);
        Update_city_txt.Text = Convert.ToString(address.city);
        Update_country_txt.Text = Convert.ToString(address.country);
        Update_County_Township_txt.Text = Convert.ToString(address.County_Township);
        Update_longitude_txt.Text = Convert.ToString(address.longitude);
        Update_latitude_txt.Text = Convert.ToString(address.latitude);
        Update_state_txt.Text = Convert.ToString(address.state);
        Update_str_add_txt.Text = Convert.ToString(address.str_add);
        Update_str_add2_txt.Text = Convert.ToString(address.str_add2);
        Update_zip_plus_four_txt.Text = Convert.ToString(address.zip_plus_four);
        return address;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        address = address_update(Convert.ToInt32(Update_address_GridView.SelectedValue));
    }
    public address address_update(int ID)
    {
        address = address.Select(ID);
        address.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        address.address_type_id = Convert.ToInt32(Update_address_type_id_txt.Text);
        address.city = Update_city_txt.Text;
        address.country = Update_country_txt.Text;
        address.County_Township = Update_County_Township_txt.Text;
        address.longitude = Convert.ToDecimal(Update_longitude_txt.Text);
        address.latitude = Convert.ToDecimal(Update_latitude_txt.Text);
        address.state = Update_state_txt.Text;
        address.str_add = Update_str_add_txt.Text;
        address.str_add2 = Update_str_add2_txt.Text;
        address.zip_plus_four = Update_zip_plus_four_txt.Text;
        address.Update(address);
        Insert_address_GridView.DataBind();
        Update_address_GridView.DataBind();
        Delete_address_GridView.DataBind();
        return address;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        address = Delete_address_select(Convert.ToInt32(Delete_address_GridView.SelectedValue));
    }
    public address Delete_address_select(int ID)
    {
        address = address.Select(ID);
        Delete_address_id_txt_lbl.Text = Convert.ToString(address.address_id);
        Delete_address_type_id_txt_lbl.Text = Convert.ToString(address.address_type_id);
        Delete_city_txt_lbl.Text = Convert.ToString(address.city);
        Delete_country_txt_lbl.Text = Convert.ToString(address.country);
        Delete_County_Township_txt_lbl.Text = Convert.ToString(address.County_Township);
        Delete_longitude_txt_lbl.Text = Convert.ToString(address.longitude);
        Delete_latitude_txt_lbl.Text = Convert.ToString(address.latitude);
        Delete_state_txt_lbl.Text = Convert.ToString(address.state);
        Delete_str_add_txt_lbl.Text = Convert.ToString(address.str_add);
        Delete_str_add2_txt_lbl.Text = Convert.ToString(address.str_add2);
        Delete_zip_plus_four_txt_lbl.Text = Convert.ToString(address.zip_plus_four);
        return address;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        address_delete(Convert.ToInt32(Delete_address_GridView.SelectedValue));
    }
    public void address_delete(int ID)
    {
        address.Delete(ID);
        Insert_address_GridView.DataBind();
        Update_address_GridView.DataBind();
        Delete_address_GridView.DataBind();
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

