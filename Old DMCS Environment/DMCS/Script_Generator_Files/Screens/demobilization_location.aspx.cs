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
public partial class demobilization_location_ : System.Web.UI.Page
{
            public demobilization_location demobilization_location = new demobilization_location();
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
        demobilization_location = Insert_demobilization_location_select(Convert.ToInt32(Insert_demobilization_location_GridView.SelectedValue));
    }
    public demobilization_location Insert_demobilization_location_select(int ID)
    {
        demobilization_location = demobilization_location.Select(ID);
        Insert_demo_id_txt.Text = Convert.ToString(demobilization_location.demo_id);
        Insert_location_id_txt.Text = Convert.ToString(demobilization_location.location_id);
        Insert_location_description_txt.Text = Convert.ToString(demobilization_location.location_description);
        return demobilization_location;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        demobilization_location = demobilization_location_insert();
    }
    public demobilization_location demobilization_location_insert()
    {
        demobilization_location.demo_id = Convert.ToInt32(Insert_demo_id_txt.Text);
        demobilization_location.location_id = Convert.ToInt32(Insert_location_id_txt.Text);
        demobilization_location.location_description = Insert_location_description_txt.Text;
        demobilization_location = demobilization_location.Insert(demobilization_location);
        Insert_demobilization_location_GridView.DataBind();
        Update_demobilization_location_GridView.DataBind();
        Delete_demobilization_location_GridView.DataBind();
        return demobilization_location;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        demobilization_location = Update_demobilization_location_select(Convert.ToInt32(Update_demobilization_location_GridView.SelectedValue));
    }
    public demobilization_location Update_demobilization_location_select(int ID)
    {
        demobilization_location = demobilization_location.Select(ID);
        Update_demo_location_id_txt.Text = Convert.ToString(demobilization_location.demo_location_id);
        Update_demo_id_txt.Text = Convert.ToString(demobilization_location.demo_id);
        Update_location_id_txt.Text = Convert.ToString(demobilization_location.location_id);
        Update_location_description_txt.Text = Convert.ToString(demobilization_location.location_description);
        return demobilization_location;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        demobilization_location = demobilization_location_update(Convert.ToInt32(Update_demobilization_location_GridView.SelectedValue));
    }
    public demobilization_location demobilization_location_update(int ID)
    {
        demobilization_location = demobilization_location.Select(ID);
        demobilization_location.demo_location_id = Convert.ToInt32(Update_demo_location_id_txt.Text);
        demobilization_location.demo_id = Convert.ToInt32(Update_demo_id_txt.Text);
        demobilization_location.location_id = Convert.ToInt32(Update_location_id_txt.Text);
        demobilization_location.location_description = Update_location_description_txt.Text;
        demobilization_location.Update(demobilization_location);
        Insert_demobilization_location_GridView.DataBind();
        Update_demobilization_location_GridView.DataBind();
        Delete_demobilization_location_GridView.DataBind();
        return demobilization_location;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        demobilization_location = Delete_demobilization_location_select(Convert.ToInt32(Delete_demobilization_location_GridView.SelectedValue));
    }
    public demobilization_location Delete_demobilization_location_select(int ID)
    {
        demobilization_location = demobilization_location.Select(ID);
        Delete_demo_location_id_txt_lbl.Text = Convert.ToString(demobilization_location.demo_location_id);
        Delete_demo_id_txt_lbl.Text = Convert.ToString(demobilization_location.demo_id);
        Delete_location_id_txt_lbl.Text = Convert.ToString(demobilization_location.location_id);
        Delete_location_description_txt_lbl.Text = Convert.ToString(demobilization_location.location_description);
        return demobilization_location;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        demobilization_location_delete(Convert.ToInt32(Delete_demobilization_location_GridView.SelectedValue));
    }
    public void demobilization_location_delete(int ID)
    {
        demobilization_location.Delete(ID);
        Insert_demobilization_location_GridView.DataBind();
        Update_demobilization_location_GridView.DataBind();
        Delete_demobilization_location_GridView.DataBind();
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

