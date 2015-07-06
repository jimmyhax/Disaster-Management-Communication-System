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
public partial class Pet_Deceased_Screen : System.Web.UI.Page
{
            public Pet_Deceased Pet_Deceased = new Pet_Deceased();
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
        Pet_Deceased = Insert_Pet_Deceased_select(Convert.ToInt32(Insert_Pet_Deceased_GridView.SelectedValue));
    }
    public Pet_Deceased Insert_Pet_Deceased_select(int ID)
    {
        Pet_Deceased = Pet_Deceased.Select(ID);
        Insert_Date_Deceased_txt.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
        Insert_Location_ID_txt.Text = Convert.ToString(Pet_Deceased.Location_ID);
        Insert_Funeral_txt.Text = Convert.ToString(Pet_Deceased.Funeral);
        Insert_Cemetary_Name_txt.Text = Convert.ToString(Pet_Deceased.Cemetary_Name);
        Insert_Deceased_Type_txt.Text = Convert.ToString(Pet_Deceased.Deceased_Type);
        Insert_Date_Created_txt.Text = Convert.ToString(Pet_Deceased.Date_Created);
        Insert_Date_Modified_txt.Text = Convert.ToString(Pet_Deceased.Date_Modified);
        return Pet_Deceased;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pet_Deceased = Pet_Deceased_insert();
    }
    public Pet_Deceased Pet_Deceased_insert()
    {
        Pet_Deceased.Date_Deceased = Convert.ToDateTime(Insert_Date_Deceased_txt.Text);
        Pet_Deceased.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        Pet_Deceased.Funeral = Insert_Funeral_txt.Text;
        Pet_Deceased.Cemetary_Name = Insert_Cemetary_Name_txt.Text;
        Pet_Deceased.Deceased_Type = Insert_Deceased_Type_txt.Text;
        Pet_Deceased.Date_Created = Convert.ToDateTime(Insert_Date_Created_txt.Text);
        Pet_Deceased.Date_Modified = Convert.ToDateTime(Insert_Date_Modified_txt.Text);
        Pet_Deceased = Pet_Deceased.Insert(Pet_Deceased);
        Insert_Pet_Deceased_GridView.DataBind();
        Update_Pet_Deceased_GridView.DataBind();
        Delete_Pet_Deceased_GridView.DataBind();
        return Pet_Deceased;
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
        Pet_Deceased = Update_Pet_Deceased_select(Convert.ToInt32(Update_Pet_Deceased_GridView.SelectedValue));
    }
    public Pet_Deceased Update_Pet_Deceased_select(int ID)
    {
        Pet_Deceased = Pet_Deceased.Select(ID);
        Update_Pet_Deceased_ID_txt.Text = Convert.ToString(Pet_Deceased.Pet_Deceased_ID);
        Update_Date_Deceased_txt.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
        Update_Location_ID_txt.Text = Convert.ToString(Pet_Deceased.Location_ID);
        Update_Funeral_txt.Text = Convert.ToString(Pet_Deceased.Funeral);
        Update_Cemetary_Name_txt.Text = Convert.ToString(Pet_Deceased.Cemetary_Name);
        Update_Deceased_Type_txt.Text = Convert.ToString(Pet_Deceased.Deceased_Type);
        Update_Date_Created_txt.Text = Convert.ToString(Pet_Deceased.Date_Created);
        Update_Date_Modified_txt.Text = Convert.ToString(Pet_Deceased.Date_Modified);
        return Pet_Deceased;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pet_Deceased = Pet_Deceased_update(Convert.ToInt32(Update_Pet_Deceased_GridView.SelectedValue));
    }
    public Pet_Deceased Pet_Deceased_update(int ID)
    {
        Pet_Deceased = Pet_Deceased.Select(ID);
        Pet_Deceased.Pet_Deceased_ID = Convert.ToInt32(Update_Pet_Deceased_ID_txt.Text);
        Pet_Deceased.Date_Deceased = Convert.ToDateTime(Update_Date_Deceased_txt.Text);
        Pet_Deceased.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        Pet_Deceased.Funeral = Update_Funeral_txt.Text;
        Pet_Deceased.Cemetary_Name = Update_Cemetary_Name_txt.Text;
        Pet_Deceased.Deceased_Type = Update_Deceased_Type_txt.Text;
        Pet_Deceased.Date_Created = Convert.ToDateTime(Update_Date_Created_txt.Text);
        Pet_Deceased.Date_Modified = Convert.ToDateTime(Update_Date_Modified_txt.Text);
        Pet_Deceased.Update(Pet_Deceased);
        Insert_Pet_Deceased_GridView.DataBind();
        Update_Pet_Deceased_GridView.DataBind();
        Delete_Pet_Deceased_GridView.DataBind();
        return Pet_Deceased;
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
        Pet_Deceased = Delete_Pet_Deceased_select(Convert.ToInt32(Delete_Pet_Deceased_GridView.SelectedValue));
    }
    public Pet_Deceased Delete_Pet_Deceased_select(int ID)
    {
        Pet_Deceased = Pet_Deceased.Select(ID);
        Delete_Pet_Deceased_ID_txt_lbl.Text = Convert.ToString(Pet_Deceased.Pet_Deceased_ID);
        Delete_Date_Deceased_txt_lbl.Text = Convert.ToString(Pet_Deceased.Date_Deceased);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(Pet_Deceased.Location_ID);
        Delete_Funeral_txt_lbl.Text = Convert.ToString(Pet_Deceased.Funeral);
        Delete_Cemetary_Name_txt_lbl.Text = Convert.ToString(Pet_Deceased.Cemetary_Name);
        Delete_Deceased_Type_txt_lbl.Text = Convert.ToString(Pet_Deceased.Deceased_Type);
        Delete_Date_Created_txt_lbl.Text = Convert.ToString(Pet_Deceased.Date_Created);
        Delete_Date_Modified_txt_lbl.Text = Convert.ToString(Pet_Deceased.Date_Modified);
        return Pet_Deceased;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pet_Deceased_delete(Convert.ToInt32(Delete_Pet_Deceased_GridView.SelectedValue));
    }
    public void Pet_Deceased_delete(int ID)
    {
        Pet_Deceased.Delete(ID);
        Insert_Pet_Deceased_GridView.DataBind();
        Update_Pet_Deceased_GridView.DataBind();
        Delete_Pet_Deceased_GridView.DataBind();
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

