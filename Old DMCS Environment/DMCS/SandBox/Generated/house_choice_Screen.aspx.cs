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
public partial class house_choice_Screen : System.Web.UI.Page
{
            public house_choice house_choice = new house_choice();
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
        house_choice = Insert_house_choice_select(Convert.ToInt32(Insert_house_choice_GridView.SelectedValue));
    }
    public house_choice Insert_house_choice_select(int ID)
    {
        house_choice = house_choice.Select(ID);
        Insert_house_id_txt.Text = Convert.ToString(house_choice.house_id);
        Insert_address_id_txt.Text = Convert.ToString(house_choice.address_id);
        Insert_house_choice_bathrooms_txt.Text = Convert.ToString(house_choice.house_choice_bathrooms);
        Insert_house_choice_comments_txt.Text = Convert.ToString(house_choice.house_choice_comments);
        Insert_house_choice_contact_person_id_txt.Text = Convert.ToString(house_choice.house_choice_contact_person_id);
        Insert_house_choice_laundry_txt.Text = Convert.ToString(house_choice.house_choice_laundry);
        Insert_house_choice_no_floors_txt.Text = Convert.ToString(house_choice.house_choice_no_floors);
        Insert_house_choice_parking_txt.Text = Convert.ToString(house_choice.house_choice_parking);
        Insert_house_choice_rent_txt.Text = Convert.ToString(house_choice.house_choice_rent);
        Insert_house_choice_type_txt.Text = Convert.ToString(house_choice.house_choice_type);
        Insert_house_choice_units_avail_txt.Text = Convert.ToString(house_choice.house_choice_units_avail);
        return house_choice;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        house_choice = house_choice_insert();
    }
    public house_choice house_choice_insert()
    {
        house_choice.house_id = Convert.ToInt32(Insert_house_id_txt.Text);
        house_choice.address_id = Convert.ToInt32(Insert_address_id_txt.Text);
        house_choice.house_choice_bathrooms = Convert.ToInt32(Insert_house_choice_bathrooms_txt.Text);
        house_choice.house_choice_comments = Insert_house_choice_comments_txt.Text;
        house_choice.house_choice_contact_person_id = Convert.ToInt32(Insert_house_choice_contact_person_id_txt.Text);
        house_choice.house_choice_laundry = Insert_house_choice_laundry_txt.Text;
        house_choice.house_choice_no_floors = Convert.ToInt32(Insert_house_choice_no_floors_txt.Text);
        house_choice.house_choice_parking = Insert_house_choice_parking_txt.Text;
        house_choice.house_choice_rent = Convert.ToDecimal(Insert_house_choice_rent_txt.Text);
        house_choice.house_choice_type = Insert_house_choice_type_txt.Text;
        house_choice.house_choice_units_avail = Convert.ToInt32(Insert_house_choice_units_avail_txt.Text);
        house_choice = house_choice.Insert(house_choice);
        Insert_house_choice_GridView.DataBind();
        Update_house_choice_GridView.DataBind();
        Delete_house_choice_GridView.DataBind();
        return house_choice;
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
        house_choice = Update_house_choice_select(Convert.ToInt32(Update_house_choice_GridView.SelectedValue));
    }
    public house_choice Update_house_choice_select(int ID)
    {
        house_choice = house_choice.Select(ID);
        Update_house_choice_id_txt.Text = Convert.ToString(house_choice.house_choice_id);
        Update_house_id_txt.Text = Convert.ToString(house_choice.house_id);
        Update_address_id_txt.Text = Convert.ToString(house_choice.address_id);
        Update_house_choice_bathrooms_txt.Text = Convert.ToString(house_choice.house_choice_bathrooms);
        Update_house_choice_comments_txt.Text = Convert.ToString(house_choice.house_choice_comments);
        Update_house_choice_contact_person_id_txt.Text = Convert.ToString(house_choice.house_choice_contact_person_id);
        Update_house_choice_laundry_txt.Text = Convert.ToString(house_choice.house_choice_laundry);
        Update_house_choice_no_floors_txt.Text = Convert.ToString(house_choice.house_choice_no_floors);
        Update_house_choice_parking_txt.Text = Convert.ToString(house_choice.house_choice_parking);
        Update_house_choice_rent_txt.Text = Convert.ToString(house_choice.house_choice_rent);
        Update_house_choice_type_txt.Text = Convert.ToString(house_choice.house_choice_type);
        Update_house_choice_units_avail_txt.Text = Convert.ToString(house_choice.house_choice_units_avail);
        return house_choice;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        house_choice = house_choice_update(Convert.ToInt32(Update_house_choice_GridView.SelectedValue));
    }
    public house_choice house_choice_update(int ID)
    {
        house_choice = house_choice.Select(ID);
        house_choice.house_choice_id = Convert.ToInt32(Update_house_choice_id_txt.Text);
        house_choice.house_id = Convert.ToInt32(Update_house_id_txt.Text);
        house_choice.address_id = Convert.ToInt32(Update_address_id_txt.Text);
        house_choice.house_choice_bathrooms = Convert.ToInt32(Update_house_choice_bathrooms_txt.Text);
        house_choice.house_choice_comments = Update_house_choice_comments_txt.Text;
        house_choice.house_choice_contact_person_id = Convert.ToInt32(Update_house_choice_contact_person_id_txt.Text);
        house_choice.house_choice_laundry = Update_house_choice_laundry_txt.Text;
        house_choice.house_choice_no_floors = Convert.ToInt32(Update_house_choice_no_floors_txt.Text);
        house_choice.house_choice_parking = Update_house_choice_parking_txt.Text;
        house_choice.house_choice_rent = Convert.ToDecimal(Update_house_choice_rent_txt.Text);
        house_choice.house_choice_type = Update_house_choice_type_txt.Text;
        house_choice.house_choice_units_avail = Convert.ToInt32(Update_house_choice_units_avail_txt.Text);
        house_choice.Update(house_choice);
        Insert_house_choice_GridView.DataBind();
        Update_house_choice_GridView.DataBind();
        Delete_house_choice_GridView.DataBind();
        return house_choice;
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
        house_choice = Delete_house_choice_select(Convert.ToInt32(Delete_house_choice_GridView.SelectedValue));
    }
    public house_choice Delete_house_choice_select(int ID)
    {
        house_choice = house_choice.Select(ID);
        Delete_house_choice_id_txt_lbl.Text = Convert.ToString(house_choice.house_choice_id);
        Delete_house_id_txt_lbl.Text = Convert.ToString(house_choice.house_id);
        Delete_address_id_txt_lbl.Text = Convert.ToString(house_choice.address_id);
        Delete_house_choice_bathrooms_txt_lbl.Text = Convert.ToString(house_choice.house_choice_bathrooms);
        Delete_house_choice_comments_txt_lbl.Text = Convert.ToString(house_choice.house_choice_comments);
        Delete_house_choice_contact_person_id_txt_lbl.Text = Convert.ToString(house_choice.house_choice_contact_person_id);
        Delete_house_choice_laundry_txt_lbl.Text = Convert.ToString(house_choice.house_choice_laundry);
        Delete_house_choice_no_floors_txt_lbl.Text = Convert.ToString(house_choice.house_choice_no_floors);
        Delete_house_choice_parking_txt_lbl.Text = Convert.ToString(house_choice.house_choice_parking);
        Delete_house_choice_rent_txt_lbl.Text = Convert.ToString(house_choice.house_choice_rent);
        Delete_house_choice_type_txt_lbl.Text = Convert.ToString(house_choice.house_choice_type);
        Delete_house_choice_units_avail_txt_lbl.Text = Convert.ToString(house_choice.house_choice_units_avail);
        return house_choice;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        house_choice_delete(Convert.ToInt32(Delete_house_choice_GridView.SelectedValue));
    }
    public void house_choice_delete(int ID)
    {
        house_choice.Delete(ID);
        Insert_house_choice_GridView.DataBind();
        Update_house_choice_GridView.DataBind();
        Delete_house_choice_GridView.DataBind();
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

