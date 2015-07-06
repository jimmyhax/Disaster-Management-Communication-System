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
public partial class Hours_ : System.Web.UI.Page
{
            public Hours Hours = new Hours();
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
        Hours = Insert_Hours_select(Convert.ToInt32(Insert_Hours_GridView.SelectedValue));
    }
    public Hours Insert_Hours_select(int ID)
    {
        Hours = Hours.Select(ID);
        Insert_Hours_Worked_txt.Text = Convert.ToString(Hours.Hours_Worked);
        return Hours;
    }
    protected void INSERT(object sender, EventArgs e)
    {
        Hours = Hours_insert();
    }
    public Hours Hours_insert()
    {
        Hours.Hours_Worked = Convert.ToInt32(Insert_Hours_Worked_txt.Text);
        Hours = Hours.Insert(Hours);
        Insert_Hours_GridView.DataBind();
        Update_Hours_GridView.DataBind();
        Delete_Hours_GridView.DataBind();
        return Hours;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Update Tab Methods
    protected void Update_Select_Record(object sender, EventArgs e)
    {
        Hours = Update_Hours_select(Convert.ToInt32(Update_Hours_GridView.SelectedValue));
    }
    public Hours Update_Hours_select(int ID)
    {
        Hours = Hours.Select(ID);
        Update_Hours_ID_txt.Text = Convert.ToString(Hours.Hours_ID);
        Update_Hours_Worked_txt.Text = Convert.ToString(Hours.Hours_Worked);
        return Hours;
    }
    protected void UPDATE(object sender, EventArgs e)
    {
        Hours = Hours_update(Convert.ToInt32(Update_Hours_GridView.SelectedValue));
    }
    public Hours Hours_update(int ID)
    {
        Hours = Hours.Select(ID);
        Hours.Hours_ID = Convert.ToInt32(Update_Hours_ID_txt.Text);
        Hours.Hours_Worked = Convert.ToInt32(Update_Hours_Worked_txt.Text);
        Hours.Update(Hours);
        Insert_Hours_GridView.DataBind();
        Update_Hours_GridView.DataBind();
        Delete_Hours_GridView.DataBind();
        return Hours;
    }




    /////////////////////////
    ////////////////////////
    ///////////////////////
    //////////////////////
    /////////////////////
    //Delete Tab Methods
    protected void Delete_Select_Record(object sender, EventArgs e)
    {
        Hours = Delete_Hours_select(Convert.ToInt32(Delete_Hours_GridView.SelectedValue));
    }
    public Hours Delete_Hours_select(int ID)
    {
        Hours = Hours.Select(ID);
        Delete_Hours_ID_txt_lbl.Text = Convert.ToString(Hours.Hours_ID);
        Delete_Hours_Worked_txt_lbl.Text = Convert.ToString(Hours.Hours_Worked);
        return Hours;
    }
    protected void DELETE(object sender, EventArgs e)
    {
        Hours_delete(Convert.ToInt32(Delete_Hours_GridView.SelectedValue));
    }
    public void Hours_delete(int ID)
    {
        Hours.Delete(ID);
        Insert_Hours_GridView.DataBind();
        Update_Hours_GridView.DataBind();
        Delete_Hours_GridView.DataBind();
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

