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
public partial class demobilization_ : System.Web.UI.Page
{
            public demobilization demobilization = new demobilization();
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
        demobilization = Insert_demobilization_select(Convert.ToInt32(Insert_demobilization_GridView.SelectedValue));
    }
    public demobilization Insert_demobilization_select(int ID)
    {
        demobilization = demobilization.Select(ID);
        return demobilization;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        demobilization = demobilization_insert();
    }
    public demobilization demobilization_insert()
    {
        demobilization = demobilization.Insert(demobilization);
        Insert_demobilization_GridView.DataBind();
        Update_demobilization_GridView.DataBind();
        Delete_demobilization_GridView.DataBind();
        return demobilization;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        demobilization = Update_demobilization_select(Convert.ToInt32(Update_demobilization_GridView.SelectedValue));
    }
    public demobilization Update_demobilization_select(int ID)
    {
        demobilization = demobilization.Select(ID);
        Update_demo_id_txt.Text = Convert.ToString(demobilization.demo_id);
        return demobilization;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        demobilization = demobilization_update(Convert.ToInt32(Update_demobilization_GridView.SelectedValue));
    }
    public demobilization demobilization_update(int ID)
    {
        demobilization = demobilization.Select(ID);
        demobilization.demo_id = Convert.ToInt32(Update_demo_id_txt.Text);
        demobilization.Update(demobilization);
        Insert_demobilization_GridView.DataBind();
        Update_demobilization_GridView.DataBind();
        Delete_demobilization_GridView.DataBind();
        return demobilization;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        demobilization = Delete_demobilization_select(Convert.ToInt32(Delete_demobilization_GridView.SelectedValue));
    }
    public demobilization Delete_demobilization_select(int ID)
    {
        demobilization = demobilization.Select(ID);
        Delete_demo_id_txt_lbl.Text = Convert.ToString(demobilization.demo_id);
        return demobilization;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        demobilization_delete(Convert.ToInt32(Delete_demobilization_GridView.SelectedValue));
    }
    public void demobilization_delete(int ID)
    {
        demobilization.Delete(ID);
        Insert_demobilization_GridView.DataBind();
        Update_demobilization_GridView.DataBind();
        Delete_demobilization_GridView.DataBind();
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

