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
public partial class Shelter_Screen : System.Web.UI.Page
{
            public Shelter Shelter = new Shelter();
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
        Shelter = Insert_Shelter_select(Convert.ToInt32(Insert_Shelter_GridView.SelectedValue));
    }
    public Shelter Insert_Shelter_select(int ID)
    {
        Shelter = Shelter.Select(ID);
        Insert_Address_ID_txt.Text = Convert.ToString(Shelter.Address_ID);
        Insert_Shelter_Type_txt.Text = Convert.ToString(Shelter.Shelter_Type);
        Insert_Max_Capacity_txt.Text = Convert.ToString(Shelter.Max_Capacity);
        Insert_AllowsPets_txt.Text = Convert.ToString(Shelter.AllowsPets);
        return Shelter;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Shelter = Shelter_insert();
    }
    public Shelter Shelter_insert()
    {
        Shelter.Address_ID = Convert.ToInt32(Insert_Address_ID_txt.Text);
        Shelter.Shelter_Type = Insert_Shelter_Type_txt.Text;
        Shelter.Max_Capacity = Convert.ToInt32(Insert_Max_Capacity_txt.Text);
        Shelter.AllowsPets = Insert_AllowsPets_txt.Text;
        Shelter = Shelter.Insert(Shelter);
        Insert_Shelter_GridView.DataBind();
        Update_Shelter_GridView.DataBind();
        Delete_Shelter_GridView.DataBind();
        return Shelter;
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
        Shelter = Update_Shelter_select(Convert.ToInt32(Update_Shelter_GridView.SelectedValue));
    }
    public Shelter Update_Shelter_select(int ID)
    {
        Shelter = Shelter.Select(ID);
        Update_Shelter_ID_txt.Text = Convert.ToString(Shelter.Shelter_ID);
        Update_Address_ID_txt.Text = Convert.ToString(Shelter.Address_ID);
        Update_Shelter_Type_txt.Text = Convert.ToString(Shelter.Shelter_Type);
        Update_Max_Capacity_txt.Text = Convert.ToString(Shelter.Max_Capacity);
        Update_AllowsPets_txt.Text = Convert.ToString(Shelter.AllowsPets);
        return Shelter;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Shelter = Shelter_update(Convert.ToInt32(Update_Shelter_GridView.SelectedValue));
    }
    public Shelter Shelter_update(int ID)
    {
        Shelter = Shelter.Select(ID);
        Shelter.Shelter_ID = Convert.ToInt32(Update_Shelter_ID_txt.Text);
        Shelter.Address_ID = Convert.ToInt32(Update_Address_ID_txt.Text);
        Shelter.Shelter_Type = Update_Shelter_Type_txt.Text;
        Shelter.Max_Capacity = Convert.ToInt32(Update_Max_Capacity_txt.Text);
        Shelter.AllowsPets = Update_AllowsPets_txt.Text;
        Shelter.Update(Shelter);
        Insert_Shelter_GridView.DataBind();
        Update_Shelter_GridView.DataBind();
        Delete_Shelter_GridView.DataBind();
        return Shelter;
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
        Shelter = Delete_Shelter_select(Convert.ToInt32(Delete_Shelter_GridView.SelectedValue));
    }
    public Shelter Delete_Shelter_select(int ID)
    {
        Shelter = Shelter.Select(ID);
        Delete_Shelter_ID_txt_lbl.Text = Convert.ToString(Shelter.Shelter_ID);
        Delete_Address_ID_txt_lbl.Text = Convert.ToString(Shelter.Address_ID);
        Delete_Shelter_Type_txt_lbl.Text = Convert.ToString(Shelter.Shelter_Type);
        Delete_Max_Capacity_txt_lbl.Text = Convert.ToString(Shelter.Max_Capacity);
        Delete_AllowsPets_txt_lbl.Text = Convert.ToString(Shelter.AllowsPets);
        return Shelter;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Shelter_delete(Convert.ToInt32(Delete_Shelter_GridView.SelectedValue));
    }
    public void Shelter_delete(int ID)
    {
        Shelter.Delete(ID);
        Insert_Shelter_GridView.DataBind();
        Update_Shelter_GridView.DataBind();
        Delete_Shelter_GridView.DataBind();
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

