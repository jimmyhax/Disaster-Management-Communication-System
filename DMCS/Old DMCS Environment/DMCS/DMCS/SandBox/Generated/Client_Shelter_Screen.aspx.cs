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
public partial class Client_Shelter_Screen : System.Web.UI.Page
{
            public Client_Shelter Client_Shelter = new Client_Shelter();
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
        Client_Shelter = Insert_Client_Shelter_select(Convert.ToInt32(Insert_Client_Shelter_GridView.SelectedValue));
    }
    public Client_Shelter Insert_Client_Shelter_select(int ID)
    {
        Client_Shelter = Client_Shelter.Select(ID);
        Insert_Shelter_ID_txt.Text = Convert.ToString(Client_Shelter.Shelter_ID);
        Insert_Client_ID_txt.Text = Convert.ToString(Client_Shelter.Client_ID);
        Insert_Current_address_txt.Text = Convert.ToString(Client_Shelter.Current_address);
        Insert_Current_State_txt.Text = Convert.ToString(Client_Shelter.Current_State);
        Insert_Current_City_txt.Text = Convert.ToString(Client_Shelter.Current_City);
        Insert_Current_Zip_txt.Text = Convert.ToString(Client_Shelter.Current_Zip);
        Insert_Client_registration_status_txt.Text = Convert.ToString(Client_Shelter.Client_registration_status);
        Insert_Household_size_txt.Text = Convert.ToString(Client_Shelter.Household_size);
        Insert_Shelter_supplies_txt.Text = Convert.ToString(Client_Shelter.Shelter_supplies);
        Insert_Shelter_occupancy_current_txt.Text = Convert.ToString(Client_Shelter.Shelter_occupancy_current);
        Insert_New_household_registered_txt.Text = Convert.ToString(Client_Shelter.New_household_registered);
        Insert_New_Shelter_address_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_address);
        Insert_New_Shelter_city_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_city);
        Insert_New_Shelter_State_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_State);
        Insert_New_Shelter_Zip_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_Zip);
        Insert_New_Contact_Number_txt.Text = Convert.ToString(Client_Shelter.New_Contact_Number);
        Insert_Current_household_members_safe_txt.Text = Convert.ToString(Client_Shelter.Current_household_members_safe);
        Insert_CheckIn_Date_txt.Text = Convert.ToString(Client_Shelter.CheckIn_Date);
        Insert_CheckOut_Date_txt.Text = Convert.ToString(Client_Shelter.CheckOut_Date);
        return Client_Shelter;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Client_Shelter = Client_Shelter_insert();
    }
    public Client_Shelter Client_Shelter_insert()
    {
        Client_Shelter.Shelter_ID = Convert.ToInt32(Insert_Shelter_ID_txt.Text);
        Client_Shelter.Client_ID = Convert.ToInt32(Insert_Client_ID_txt.Text);
        Client_Shelter.Current_address = Insert_Current_address_txt.Text;
        Client_Shelter.Current_State = Insert_Current_State_txt.Text;
        Client_Shelter.Current_City = Insert_Current_City_txt.Text;
        Client_Shelter.Current_Zip = Convert.ToInt32(Insert_Current_Zip_txt.Text);
        Client_Shelter.Client_registration_status = Insert_Client_registration_status_txt.Text;
        Client_Shelter.Household_size = Convert.ToInt32(Insert_Household_size_txt.Text);
        Client_Shelter.Shelter_supplies = Insert_Shelter_supplies_txt.Text;
        Client_Shelter.Shelter_occupancy_current = Insert_Shelter_occupancy_current_txt.Text;
        Client_Shelter.New_household_registered = Insert_New_household_registered_txt.Text;
        Client_Shelter.New_Shelter_address = Insert_New_Shelter_address_txt.Text;
        Client_Shelter.New_Shelter_city = Insert_New_Shelter_city_txt.Text;
        Client_Shelter.New_Shelter_State = Insert_New_Shelter_State_txt.Text;
        Client_Shelter.New_Shelter_Zip = Convert.ToInt32(Insert_New_Shelter_Zip_txt.Text);
        Client_Shelter.New_Contact_Number = Convert.ToInt32(Insert_New_Contact_Number_txt.Text);
        Client_Shelter.Current_household_members_safe = Insert_Current_household_members_safe_txt.Text;
        Client_Shelter.CheckIn_Date = Convert.ToDateTime(Insert_CheckIn_Date_txt.Text);
        Client_Shelter.CheckOut_Date = Convert.ToDateTime(Insert_CheckOut_Date_txt.Text);
        Client_Shelter = Client_Shelter.Insert(Client_Shelter);
        Insert_Client_Shelter_GridView.DataBind();
        Update_Client_Shelter_GridView.DataBind();
        Delete_Client_Shelter_GridView.DataBind();
        return Client_Shelter;
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
        Client_Shelter = Update_Client_Shelter_select(Convert.ToInt32(Update_Client_Shelter_GridView.SelectedValue));
    }
    public Client_Shelter Update_Client_Shelter_select(int ID)
    {
        Client_Shelter = Client_Shelter.Select(ID);
        Update_Client_Shelter_ID_txt.Text = Convert.ToString(Client_Shelter.Client_Shelter_ID);
        Update_Shelter_ID_txt.Text = Convert.ToString(Client_Shelter.Shelter_ID);
        Update_Client_ID_txt.Text = Convert.ToString(Client_Shelter.Client_ID);
        Update_Current_address_txt.Text = Convert.ToString(Client_Shelter.Current_address);
        Update_Current_State_txt.Text = Convert.ToString(Client_Shelter.Current_State);
        Update_Current_City_txt.Text = Convert.ToString(Client_Shelter.Current_City);
        Update_Current_Zip_txt.Text = Convert.ToString(Client_Shelter.Current_Zip);
        Update_Client_registration_status_txt.Text = Convert.ToString(Client_Shelter.Client_registration_status);
        Update_Household_size_txt.Text = Convert.ToString(Client_Shelter.Household_size);
        Update_Shelter_supplies_txt.Text = Convert.ToString(Client_Shelter.Shelter_supplies);
        Update_Shelter_occupancy_current_txt.Text = Convert.ToString(Client_Shelter.Shelter_occupancy_current);
        Update_New_household_registered_txt.Text = Convert.ToString(Client_Shelter.New_household_registered);
        Update_New_Shelter_address_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_address);
        Update_New_Shelter_city_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_city);
        Update_New_Shelter_State_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_State);
        Update_New_Shelter_Zip_txt.Text = Convert.ToString(Client_Shelter.New_Shelter_Zip);
        Update_New_Contact_Number_txt.Text = Convert.ToString(Client_Shelter.New_Contact_Number);
        Update_Current_household_members_safe_txt.Text = Convert.ToString(Client_Shelter.Current_household_members_safe);
        Update_CheckIn_Date_txt.Text = Convert.ToString(Client_Shelter.CheckIn_Date);
        Update_CheckOut_Date_txt.Text = Convert.ToString(Client_Shelter.CheckOut_Date);
        return Client_Shelter;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Client_Shelter = Client_Shelter_update(Convert.ToInt32(Update_Client_Shelter_GridView.SelectedValue));
    }
    public Client_Shelter Client_Shelter_update(int ID)
    {
        Client_Shelter = Client_Shelter.Select(ID);
        Client_Shelter.Client_Shelter_ID = Convert.ToInt32(Update_Client_Shelter_ID_txt.Text);
        Client_Shelter.Shelter_ID = Convert.ToInt32(Update_Shelter_ID_txt.Text);
        Client_Shelter.Client_ID = Convert.ToInt32(Update_Client_ID_txt.Text);
        Client_Shelter.Current_address = Update_Current_address_txt.Text;
        Client_Shelter.Current_State = Update_Current_State_txt.Text;
        Client_Shelter.Current_City = Update_Current_City_txt.Text;
        Client_Shelter.Current_Zip = Convert.ToInt32(Update_Current_Zip_txt.Text);
        Client_Shelter.Client_registration_status = Update_Client_registration_status_txt.Text;
        Client_Shelter.Household_size = Convert.ToInt32(Update_Household_size_txt.Text);
        Client_Shelter.Shelter_supplies = Update_Shelter_supplies_txt.Text;
        Client_Shelter.Shelter_occupancy_current = Update_Shelter_occupancy_current_txt.Text;
        Client_Shelter.New_household_registered = Update_New_household_registered_txt.Text;
        Client_Shelter.New_Shelter_address = Update_New_Shelter_address_txt.Text;
        Client_Shelter.New_Shelter_city = Update_New_Shelter_city_txt.Text;
        Client_Shelter.New_Shelter_State = Update_New_Shelter_State_txt.Text;
        Client_Shelter.New_Shelter_Zip = Convert.ToInt32(Update_New_Shelter_Zip_txt.Text);
        Client_Shelter.New_Contact_Number = Convert.ToInt32(Update_New_Contact_Number_txt.Text);
        Client_Shelter.Current_household_members_safe = Update_Current_household_members_safe_txt.Text;
        Client_Shelter.CheckIn_Date = Convert.ToDateTime(Update_CheckIn_Date_txt.Text);
        Client_Shelter.CheckOut_Date = Convert.ToDateTime(Update_CheckOut_Date_txt.Text);
        Client_Shelter.Update(Client_Shelter);
        Insert_Client_Shelter_GridView.DataBind();
        Update_Client_Shelter_GridView.DataBind();
        Delete_Client_Shelter_GridView.DataBind();
        return Client_Shelter;
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
        Client_Shelter = Delete_Client_Shelter_select(Convert.ToInt32(Delete_Client_Shelter_GridView.SelectedValue));
    }
    public Client_Shelter Delete_Client_Shelter_select(int ID)
    {
        Client_Shelter = Client_Shelter.Select(ID);
        Delete_Client_Shelter_ID_txt_lbl.Text = Convert.ToString(Client_Shelter.Client_Shelter_ID);
        Delete_Shelter_ID_txt_lbl.Text = Convert.ToString(Client_Shelter.Shelter_ID);
        Delete_Client_ID_txt_lbl.Text = Convert.ToString(Client_Shelter.Client_ID);
        Delete_Current_address_txt_lbl.Text = Convert.ToString(Client_Shelter.Current_address);
        Delete_Current_State_txt_lbl.Text = Convert.ToString(Client_Shelter.Current_State);
        Delete_Current_City_txt_lbl.Text = Convert.ToString(Client_Shelter.Current_City);
        Delete_Current_Zip_txt_lbl.Text = Convert.ToString(Client_Shelter.Current_Zip);
        Delete_Client_registration_status_txt_lbl.Text = Convert.ToString(Client_Shelter.Client_registration_status);
        Delete_Household_size_txt_lbl.Text = Convert.ToString(Client_Shelter.Household_size);
        Delete_Shelter_supplies_txt_lbl.Text = Convert.ToString(Client_Shelter.Shelter_supplies);
        Delete_Shelter_occupancy_current_txt_lbl.Text = Convert.ToString(Client_Shelter.Shelter_occupancy_current);
        Delete_New_household_registered_txt_lbl.Text = Convert.ToString(Client_Shelter.New_household_registered);
        Delete_New_Shelter_address_txt_lbl.Text = Convert.ToString(Client_Shelter.New_Shelter_address);
        Delete_New_Shelter_city_txt_lbl.Text = Convert.ToString(Client_Shelter.New_Shelter_city);
        Delete_New_Shelter_State_txt_lbl.Text = Convert.ToString(Client_Shelter.New_Shelter_State);
        Delete_New_Shelter_Zip_txt_lbl.Text = Convert.ToString(Client_Shelter.New_Shelter_Zip);
        Delete_New_Contact_Number_txt_lbl.Text = Convert.ToString(Client_Shelter.New_Contact_Number);
        Delete_Current_household_members_safe_txt_lbl.Text = Convert.ToString(Client_Shelter.Current_household_members_safe);
        Delete_CheckIn_Date_txt_lbl.Text = Convert.ToString(Client_Shelter.CheckIn_Date);
        Delete_CheckOut_Date_txt_lbl.Text = Convert.ToString(Client_Shelter.CheckOut_Date);
        return Client_Shelter;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Client_Shelter_delete(Convert.ToInt32(Delete_Client_Shelter_GridView.SelectedValue));
    }
    public void Client_Shelter_delete(int ID)
    {
        Client_Shelter.Delete(ID);
        Insert_Client_Shelter_GridView.DataBind();
        Update_Client_Shelter_GridView.DataBind();
        Delete_Client_Shelter_GridView.DataBind();
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

