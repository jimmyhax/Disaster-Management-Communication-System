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
public partial class Pet_Vaccine_Type_Screen : System.Web.UI.Page
{
            public Pet_Vaccine_Type Pet_Vaccine_Type = new Pet_Vaccine_Type();
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
        Pet_Vaccine_Type = Insert_Pet_Vaccine_Type_select(Convert.ToInt32(Insert_Pet_Vaccine_Type_GridView.SelectedValue));
    }
    public Pet_Vaccine_Type Insert_Pet_Vaccine_Type_select(int ID)
    {
        Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
        Insert_Vaccine_Name_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Name);
        Insert_Vaccine_Reactions_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Reactions);
        Insert_Vaccine_Type_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type);
        Insert_Vaccine_Description_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Description);
        return Pet_Vaccine_Type;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pet_Vaccine_Type = Pet_Vaccine_Type_insert();
    }
    public Pet_Vaccine_Type Pet_Vaccine_Type_insert()
    {
        Pet_Vaccine_Type.Vaccine_Name = Insert_Vaccine_Name_txt.Text;
        Pet_Vaccine_Type.Vaccine_Reactions = Insert_Vaccine_Reactions_txt.Text;
        Pet_Vaccine_Type.Vaccine_Type = Insert_Vaccine_Type_txt.Text;
        Pet_Vaccine_Type.Vaccine_Description = Insert_Vaccine_Description_txt.Text;
        Pet_Vaccine_Type = Pet_Vaccine_Type.Insert(Pet_Vaccine_Type);
        Insert_Pet_Vaccine_Type_GridView.DataBind();
        Update_Pet_Vaccine_Type_GridView.DataBind();
        Delete_Pet_Vaccine_Type_GridView.DataBind();
        return Pet_Vaccine_Type;
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
        Pet_Vaccine_Type = Update_Pet_Vaccine_Type_select(Convert.ToInt32(Update_Pet_Vaccine_Type_GridView.SelectedValue));
    }
    public Pet_Vaccine_Type Update_Pet_Vaccine_Type_select(int ID)
    {
        Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
        Update_Vaccine_Type_ID_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type_ID);
        Update_Vaccine_Name_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Name);
        Update_Vaccine_Reactions_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Reactions);
        Update_Vaccine_Type_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type);
        Update_Vaccine_Description_txt.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Description);
        return Pet_Vaccine_Type;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pet_Vaccine_Type = Pet_Vaccine_Type_update(Convert.ToInt32(Update_Pet_Vaccine_Type_GridView.SelectedValue));
    }
    public Pet_Vaccine_Type Pet_Vaccine_Type_update(int ID)
    {
        Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
        Pet_Vaccine_Type.Vaccine_Type_ID = Convert.ToInt32(Update_Vaccine_Type_ID_txt.Text);
        Pet_Vaccine_Type.Vaccine_Name = Update_Vaccine_Name_txt.Text;
        Pet_Vaccine_Type.Vaccine_Reactions = Update_Vaccine_Reactions_txt.Text;
        Pet_Vaccine_Type.Vaccine_Type = Update_Vaccine_Type_txt.Text;
        Pet_Vaccine_Type.Vaccine_Description = Update_Vaccine_Description_txt.Text;
        Pet_Vaccine_Type.Update(Pet_Vaccine_Type);
        Insert_Pet_Vaccine_Type_GridView.DataBind();
        Update_Pet_Vaccine_Type_GridView.DataBind();
        Delete_Pet_Vaccine_Type_GridView.DataBind();
        return Pet_Vaccine_Type;
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
        Pet_Vaccine_Type = Delete_Pet_Vaccine_Type_select(Convert.ToInt32(Delete_Pet_Vaccine_Type_GridView.SelectedValue));
    }
    public Pet_Vaccine_Type Delete_Pet_Vaccine_Type_select(int ID)
    {
        Pet_Vaccine_Type = Pet_Vaccine_Type.Select(ID);
        Delete_Vaccine_Type_ID_txt_lbl.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type_ID);
        Delete_Vaccine_Name_txt_lbl.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Name);
        Delete_Vaccine_Reactions_txt_lbl.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Reactions);
        Delete_Vaccine_Type_txt_lbl.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Type);
        Delete_Vaccine_Description_txt_lbl.Text = Convert.ToString(Pet_Vaccine_Type.Vaccine_Description);
        return Pet_Vaccine_Type;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pet_Vaccine_Type_delete(Convert.ToInt32(Delete_Pet_Vaccine_Type_GridView.SelectedValue));
    }
    public void Pet_Vaccine_Type_delete(int ID)
    {
        Pet_Vaccine_Type.Delete(ID);
        Insert_Pet_Vaccine_Type_GridView.DataBind();
        Update_Pet_Vaccine_Type_GridView.DataBind();
        Delete_Pet_Vaccine_Type_GridView.DataBind();
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

