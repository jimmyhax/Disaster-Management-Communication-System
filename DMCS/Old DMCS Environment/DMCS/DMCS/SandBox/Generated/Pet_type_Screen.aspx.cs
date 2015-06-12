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
public partial class Pet_type_Screen : System.Web.UI.Page
{
            public Pet_type Pet_type = new Pet_type();
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
        Pet_type = Insert_Pet_type_select(Convert.ToInt32(Insert_Pet_type_GridView.SelectedValue));
    }
    public Pet_type Insert_Pet_type_select(int ID)
    {
        Pet_type = Pet_type.Select(ID);
        Insert_Pet_Species_txt.Text = Convert.ToString(Pet_type.Pet_Species);
        Insert_Pet_Type_txt.Text = Convert.ToString(Pet_type.Pet_Type);
        Insert_Pet_Breed_txt.Text = Convert.ToString(Pet_type.Pet_Breed);
        return Pet_type;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Pet_type = Pet_type_insert();
    }
    public Pet_type Pet_type_insert()
    {
        Pet_type.Pet_Species = Insert_Pet_Species_txt.Text;
        Pet_type.Pet_Type = Insert_Pet_Type_txt.Text;
        Pet_type.Pet_Breed = Insert_Pet_Breed_txt.Text;
        Pet_type = Pet_type.Insert(Pet_type);
        Insert_Pet_type_GridView.DataBind();
        Update_Pet_type_GridView.DataBind();
        Delete_Pet_type_GridView.DataBind();
        return Pet_type;
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
        Pet_type = Update_Pet_type_select(Convert.ToInt32(Update_Pet_type_GridView.SelectedValue));
    }
    public Pet_type Update_Pet_type_select(int ID)
    {
        Pet_type = Pet_type.Select(ID);
        Update_Pet_Type_ID_txt.Text = Convert.ToString(Pet_type.Pet_Type_ID);
        Update_Pet_Species_txt.Text = Convert.ToString(Pet_type.Pet_Species);
        Update_Pet_Type_txt.Text = Convert.ToString(Pet_type.Pet_Type);
        Update_Pet_Breed_txt.Text = Convert.ToString(Pet_type.Pet_Breed);
        return Pet_type;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Pet_type = Pet_type_update(Convert.ToInt32(Update_Pet_type_GridView.SelectedValue));
    }
    public Pet_type Pet_type_update(int ID)
    {
        Pet_type = Pet_type.Select(ID);
        Pet_type.Pet_Type_ID = Convert.ToInt32(Update_Pet_Type_ID_txt.Text);
        Pet_type.Pet_Species = Update_Pet_Species_txt.Text;
        Pet_type.Pet_Type = Update_Pet_Type_txt.Text;
        Pet_type.Pet_Breed = Update_Pet_Breed_txt.Text;
        Pet_type.Update(Pet_type);
        Insert_Pet_type_GridView.DataBind();
        Update_Pet_type_GridView.DataBind();
        Delete_Pet_type_GridView.DataBind();
        return Pet_type;
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
        Pet_type = Delete_Pet_type_select(Convert.ToInt32(Delete_Pet_type_GridView.SelectedValue));
    }
    public Pet_type Delete_Pet_type_select(int ID)
    {
        Pet_type = Pet_type.Select(ID);
        Delete_Pet_Type_ID_txt_lbl.Text = Convert.ToString(Pet_type.Pet_Type_ID);
        Delete_Pet_Species_txt_lbl.Text = Convert.ToString(Pet_type.Pet_Species);
        Delete_Pet_Type_txt_lbl.Text = Convert.ToString(Pet_type.Pet_Type);
        Delete_Pet_Breed_txt_lbl.Text = Convert.ToString(Pet_type.Pet_Breed);
        return Pet_type;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Pet_type_delete(Convert.ToInt32(Delete_Pet_type_GridView.SelectedValue));
    }
    public void Pet_type_delete(int ID)
    {
        Pet_type.Delete(ID);
        Insert_Pet_type_GridView.DataBind();
        Update_Pet_type_GridView.DataBind();
        Delete_Pet_type_GridView.DataBind();
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

