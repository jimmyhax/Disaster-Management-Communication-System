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
public partial class Evacuation_Area_Screen : System.Web.UI.Page
{
            public Evacuation_Area Evacuation_Area = new Evacuation_Area();
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
        Evacuation_Area = Insert_Evacuation_Area_select(Convert.ToInt32(Insert_Evacuation_Area_GridView.SelectedValue));
    }
    public Evacuation_Area Insert_Evacuation_Area_select(int ID)
    {
        Evacuation_Area = Evacuation_Area.Select(ID);
        Insert_Location_ID_txt.Text = Convert.ToString(Evacuation_Area.Location_ID);
        return Evacuation_Area;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Evacuation_Area = Evacuation_Area_insert();
    }
    public Evacuation_Area Evacuation_Area_insert()
    {
        Evacuation_Area.Location_ID = Convert.ToInt32(Insert_Location_ID_txt.Text);
        Evacuation_Area = Evacuation_Area.Insert(Evacuation_Area);
        Insert_Evacuation_Area_GridView.DataBind();
        Update_Evacuation_Area_GridView.DataBind();
        Delete_Evacuation_Area_GridView.DataBind();
        return Evacuation_Area;
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
        Evacuation_Area = Update_Evacuation_Area_select(Convert.ToInt32(Update_Evacuation_Area_GridView.SelectedValue));
    }
    public Evacuation_Area Update_Evacuation_Area_select(int ID)
    {
        Evacuation_Area = Evacuation_Area.Select(ID);
        Update_Evacuation_Area_ID_txt.Text = Convert.ToString(Evacuation_Area.Evacuation_Area_ID);
        Update_Location_ID_txt.Text = Convert.ToString(Evacuation_Area.Location_ID);
        return Evacuation_Area;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Evacuation_Area = Evacuation_Area_update(Convert.ToInt32(Update_Evacuation_Area_GridView.SelectedValue));
    }
    public Evacuation_Area Evacuation_Area_update(int ID)
    {
        Evacuation_Area = Evacuation_Area.Select(ID);
        Evacuation_Area.Evacuation_Area_ID = Convert.ToInt32(Update_Evacuation_Area_ID_txt.Text);
        Evacuation_Area.Location_ID = Convert.ToInt32(Update_Location_ID_txt.Text);
        Evacuation_Area.Update(Evacuation_Area);
        Insert_Evacuation_Area_GridView.DataBind();
        Update_Evacuation_Area_GridView.DataBind();
        Delete_Evacuation_Area_GridView.DataBind();
        return Evacuation_Area;
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
        Evacuation_Area = Delete_Evacuation_Area_select(Convert.ToInt32(Delete_Evacuation_Area_GridView.SelectedValue));
    }
    public Evacuation_Area Delete_Evacuation_Area_select(int ID)
    {
        Evacuation_Area = Evacuation_Area.Select(ID);
        Delete_Evacuation_Area_ID_txt_lbl.Text = Convert.ToString(Evacuation_Area.Evacuation_Area_ID);
        Delete_Location_ID_txt_lbl.Text = Convert.ToString(Evacuation_Area.Location_ID);
        return Evacuation_Area;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Evacuation_Area_delete(Convert.ToInt32(Delete_Evacuation_Area_GridView.SelectedValue));
    }
    public void Evacuation_Area_delete(int ID)
    {
        Evacuation_Area.Delete(ID);
        Insert_Evacuation_Area_GridView.DataBind();
        Update_Evacuation_Area_GridView.DataBind();
        Delete_Evacuation_Area_GridView.DataBind();
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

